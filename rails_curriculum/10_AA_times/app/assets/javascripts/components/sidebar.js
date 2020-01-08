/* global $ */

// dropdown function that applies or removes 'expand' class to the sections-sidebar nav
const toggleSidebar = () => {
	$("#sections-sidebar").toggleClass('expand');
}

const toggleSideBarIfExpanded = (e) => {
	e.preventDefault();
	if(e.currentTarget.className === 'sections-sidebar expand') {
		setTimeout(toggleSidebar, 1000);
	}
}

// Add click listener to hamburger icon which invokes sidebar function
$(() => $('#sections-sidebar-btn').on('click', toggleSidebar));


// Close an expanded sidebar after 1 second if mouse leaves sidebar element
// Incomplete feature because sidebar does not remain open if mouse reenters element
$(() => $('#sections-sidebar').mouseleave(toggleSideBarIfExpanded));


