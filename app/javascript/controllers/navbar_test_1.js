// for navbar on small screen size
var toggleOpen = document.getElementById('toggleOpen');
var toggleClose = document.getElementById('toggleClose');
var collapseMenu = document.getElementById('collapseMenu');

function handleClick() {
  if (collapseMenu.style.display === 'block') {
    collapseMenu.style.display = 'none';
  } else {
    collapseMenu.style.display = 'block';
  }
}

toggleOpen.addEventListener('click', handleClick);
toggleClose.addEventListener('click', handleClick);

// for profile dropdown
var toggleDropdown = document.getElementById('profile-dropdown-toggle');
var dropdownMenu = document.getElementById('profile-dropdown-menu');

function handleToggle(event) {
  dropdownMenu.classList.toggle('hidden');
}

// Add event listener for toggle button
toggleDropdown.addEventListener('click', function (event) {
  event.stopPropagation();
  handleToggle(event);
});

// Add event listener to hide the dropdown when clicking outside
document.addEventListener('click', function (event) {
  if (
    !dropdownMenu.classList.contains('hidden') &&
    !dropdownMenu.contains(event.target) &&
    event.target !== toggleDropdown
  ) {
    dropdownMenu.classList.add('hidden');
  }
});