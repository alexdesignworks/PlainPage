Plain Page - XHTML CSS JS Starter Kit
-------------------------------------
Project page: https://github.com/alexdesignworks/PlainPage
License: LICENSE.TXT (http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)

Remember those times when you have to start new project from blank files and think about all tricks you've used on previous projects? Isn't it annoying to dig and copy-paste found solutions in those blank files?

Plain Page provides you with as set of proven best XHTML, CSS and JS practices in web-development.

Maintainers and Contributors
----------------------------
Your web-dev ninja trick is not here? Your are more than welcome to submit feature requests.

You can also contribute to this project as co-maintainer. Express your interest by emailing to alex.designworks@gmail.com.

Why this and how this is different from Compass or Twitter Bootstrap?
---------------------------------------------------------------------
Very good question indeed!
The main idea of this project is to Kick-off the development, but with minimum legacy code.
Unlike Twitter Bootstrap, you do not need to include all styles and scripts into your project. Instead,
you cherry-pick only the parts you need through mixins (thanks SASS!) and use them in your project.
Styles within plainpage.scss (and plainpage.css) file have already been cherry-picked from huge Compass framework
with some additions.
All partials organized in the ay that they can be used outside of plainpage.scss in your own files.

This approach is very helpful when designing modules or applications that will be used as a part of other systems. In other words, this is "pre-made mix for bricks rather then bricks themselves".

Features
--------

LAYOUT - XHTML template with fixed footer support
LAYOUT - conditional html tag for different versions of IE (6,7,8,9)

CSS - cross-browser CSS reset, including HTML5
CSS - development elements outline
CSS - handheld devices support
CSS - Drupal reset
CSS - font-size dependable typography with test page

JS - CDN hosted jQuery with local fallback fail safe.
JS - IE 5.5+ PNG fix
JS - console.log failsafe support
JS - dump function (PHP print_r analog)

DESIGN - Fireworks PNG design grids with browsers windows.
DESIGN - Fireworks PNG wireframes for quick prototyping.

DOCS - Strong CSS, JS and XHTML formatting standards.
DOCS - HTML element testing description.


Requirements
------------
Installed Ruby with Compass if you need to rebuild PlainPage itself.

Credits
-------
This project is maintained by Alex Skrypnyk (alex.designworks@gmail.com)

Please feel free to report bugs and create feature requests at https://github.com/alexdesignworks/PlainPage/issues.