'use strict';

const categories = require.main.require('./src/categories');
const privileges = require.main.require('./src/privileges');
const helpers = require.main.require('./src/controllers/helpers');

// The board index (/ and /categories, page and API). The controller has
// already loaded the whole tree, counted topics and posts into every level and
// attached each category's last post; templates/categories.tpl renders
// `sections` from it. `categories` itself stays as NodeBB built it.
exports.buildIndex = async function (hookData) {
	const data = hookData.templateData;
	const boards = data.categories.flatMap(root => root.children);
	await restoreSubcategories(boards, hookData.req.uid);
	// Only the roots get a teaser from the controller; the row's mobile badge reads it.
	boards.forEach(helpers.setCategoryTeaser);

	// A top-level category with children is a section: its name is the title
	// bar, its children are the rows. Consecutive ones without children share
	// one box without a title bar, as rows themselves.
	data.sections = data.categories.reduce((sections, root) => {
		const last = sections[sections.length - 1];
		if (root.children.length) {
			sections.push({ head: root, rows: root.children });
		} else if (last && !last.head) {
			last.rows.push(root);
		} else {
			sections.push({ head: null, rows: [root] });
		}
		return sections;
	}, []);
	return hookData;
};

// The controller's trimChildren drops the boards' own children (it keeps them
// only below a root marked as section). The rows link them, so load them back:
// the direct children the reader may find (filterCids also drops disabled
// ones), capped like NodeBB caps a list.
async function restoreSubcategories(boards, uid) {
	const childCids = await Promise.all(boards.map(board => categories.getAllCidsFromSet(`cid:${board.cid}:children`)));
	const visible = await privileges.categories.filterCids('find', childCids.flat(), uid);
	const children = await categories.getCategoriesFields(visible, ['cid', 'name', 'slug', 'link', 'isSection']);
	const byCid = new Map(children.map(c => [String(c.cid), c]));
	boards.forEach((board, i) => {
		board.children = childCids[i]
			.map(cid => byCid.get(String(cid)))
			.filter(Boolean)
			.slice(0, board.subCategoriesPerPage);
	});
}

// The topic's author column (templates/partials/topic/post.tpl) shows when
// each author joined; NodeBB loads post authors without it.
exports.addPostUserFields = async function (hookData) {
	hookData.fields.push('joindate');
	return hookData;
};
