-- ============================================================
-- Course 1: Programing logic with JavaScript
-- ============================================================
INSERT INTO tb_courses (title, description) VALUES
    ('Programing logic with JavaScript', 'Learn the fundamentals of programming logic using JavaScript.'),
    ('HTML CSS and Javascript', 'Master frontend web development with HTML, CSS, and JavaScript.');

-- ============================================================
-- Sections for Course 1 (id=1)
-- ============================================================
INSERT INTO tb_sections (title, list_order, course_id) VALUES
    ('Introduction to Programming', 1, 1),
    ('Variables and Data Types', 2, 1),
    ('Operators and Expressions', 3, 1),
    ('Control Flow: Conditionals', 4, 1),
    ('Control Flow: Loops', 5, 1),
    ('Functions', 6, 1),
    ('Arrays', 7, 1),
    ('Objects and Introduction to OOP', 8, 1);

-- ============================================================
-- Sections for Course 2 (id=2)
-- ============================================================
INSERT INTO tb_sections (title, list_order, course_id) VALUES
    ('Introduction to HTML', 1, 2),
    ('HTML Structure and Semantics', 2, 2),
    ('Introduction to CSS', 3, 2),
    ('CSS Box Model and Layout', 4, 2),
    ('Flexbox and Grid', 5, 2),
    ('Introduction to JavaScript in the Browser', 6, 2),
    ('DOM Manipulation', 7, 2),
    ('Events and Forms', 8, 2);

-- ============================================================
-- Lessons and Exercises: Course 1, Section 1 (Introduction to Programming)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('What is a program?', 'A program is a sequence of instructions executed by a computer to perform a task. Programming logic is the foundation that allows us to think algorithmically and solve problems step by step.', 1, 1),
    ('Algorithms and Flowcharts', 'An algorithm is a finite sequence of well-defined instructions. Flowcharts are a visual way to represent algorithms using shapes like diamonds for decisions and rectangles for actions.', 2, 1),
    ('Your First JavaScript Code', 'JavaScript runs in the browser. You can use the console.log() function to output text. Example: console.log("Hello, World!");', 3, 1);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What is a program?', 1, 1),
    ('What shape represents a decision in a flowchart?', 0, 2),
    ('Which function is used to print output in JavaScript?', 2, 3);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (1, 'A type of hardware'),
    (1, 'A set of instructions executed by a computer'),
    (1, 'An operating system'),
    (1, 'A database'),
    (2, 'Diamond'),
    (2, 'Rectangle'),
    (2, 'Circle'),
    (2, 'Triangle'),
    (3, 'print()'),
    (3, 'output()'),
    (3, 'console.log()'),
    (3, 'write()');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 2 (Variables and Data Types)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('What is a Variable?', 'A variable is a container that stores data. In JavaScript, you can declare variables using var, let, or const.', 1, 2),
    ('Primitive Data Types', 'JavaScript has 7 primitive types: string, number, bigint, boolean, undefined, symbol, and null.', 2, 2),
    ('Declaring Variables', 'Use let for variables that can change, and const for constants. Example: let age = 25; const name = "Bruno";', 3, 2);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Which keyword declares a variable that cannot be reassigned?', 1, 4),
    ('Which of the following is NOT a primitive type in JavaScript?', 3, 5),
    ('What is the correct way to declare a variable in modern JavaScript?', 0, 6);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (4, 'var'),
    (4, 'const'),
    (4, 'let'),
    (4, 'define'),
    (5, 'string'),
    (5, 'boolean'),
    (5, 'number'),
    (5, 'array'),
    (6, 'let x = 10;'),
    (6, 'variable x = 10;'),
    (6, 'x := 10;'),
    (6, 'int x = 10;');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 3 (Operators and Expressions)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Arithmetic Operators', 'JavaScript supports +, -, *, /, % (modulo), and ** (exponentiation). Example: let result = 10 % 3; // result is 1', 1, 3),
    ('Comparison Operators', 'Comparison operators return a boolean: ==, ===, !=, !==, <, >, <=, >=. Always prefer === for strict equality.', 2, 3),
    ('Logical Operators', 'Logical operators combine conditions: && (AND), || (OR), ! (NOT). Example: if (age > 18 && hasId) { /* allowed */ }', 3, 3);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What is the result of 10 % 3 in JavaScript?', 0, 7),
    ('Which operator checks both value AND type?', 2, 8),
    ('What does the && operator do?', 1, 9);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (7, '1'),
    (7, '3'),
    (7, '0'),
    (7, '10'),
    (8, '=='),
    (8, '!='),
    (8, '==='),
    (8, '!=='),
    (9, 'Returns true if at least one condition is true'),
    (9, 'Returns true only if both conditions are true'),
    (9, 'Negates a condition'),
    (9, 'Compares two values');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 4 (Control Flow: Conditionals)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('The if Statement', 'The if statement executes a block of code only if a condition is true. Syntax: if (condition) { // code }', 1, 4),
    ('if / else and else if', 'Extend the if statement with else to handle the false case, and else if to test multiple conditions.', 2, 4),
    ('The switch Statement', 'switch is useful when comparing one value against many cases. Each case ends with break to prevent fall-through.', 3, 4);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Which keyword handles the "otherwise" path in an if statement?', 0, 10),
    ('What keyword ends a case in a switch statement?', 2, 11),
    ('What will execute if none of the if/else if conditions are true?', 1, 12);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (10, 'else'),
    (10, 'otherwise'),
    (10, 'default'),
    (10, 'catch'),
    (11, 'end'),
    (11, 'stop'),
    (11, 'break'),
    (11, 'exit'),
    (12, 'The first if block'),
    (12, 'The else block'),
    (12, 'The program crashes'),
    (12, 'Nothing runs');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 5 (Control Flow: Loops)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('The for Loop', 'A for loop repeats code a set number of times. Syntax: for (let i = 0; i < 5; i++) { console.log(i); }', 1, 5),
    ('The while Loop', 'A while loop runs as long as the condition is true. Be careful of infinite loops! Example: while (x > 0) { x--; }', 2, 5),
    ('break and continue', 'break exits the loop immediately. continue skips the current iteration and moves to the next one.', 3, 5);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('How many times does a for loop run with i < 3 starting at i = 0?', 1, 13),
    ('Which loop checks its condition BEFORE executing the body?', 0, 14),
    ('What does the continue keyword do inside a loop?', 3, 15);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (13, '2'),
    (13, '3'),
    (13, '4'),
    (13, '0'),
    (14, 'while'),
    (14, 'do-while'),
    (14, 'for-each'),
    (14, 'repeat'),
    (15, 'Exits the loop'),
    (15, 'Restarts the loop from the beginning'),
    (15, 'Pauses the loop'),
    (15, 'Skips the current iteration');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 6 (Functions)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Declaring a Function', 'Functions are reusable blocks of code. Syntax: function greet(name) { return "Hello " + name; }', 1, 6),
    ('Parameters and Return Values', 'Parameters are inputs to a function. The return keyword sends a value back to the caller. Functions without return give undefined.', 2, 6),
    ('Arrow Functions', 'Arrow functions are a shorter syntax: const add = (a, b) => a + b;. They are commonly used in modern JavaScript.', 3, 6);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What keyword is used to define a function?', 2, 16),
    ('What does the return keyword do?', 0, 17),
    ('Which is a valid arrow function?', 1, 18);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (16, 'def'),
    (16, 'func'),
    (16, 'function'),
    (16, 'method'),
    (17, 'Sends a value back from the function'),
    (17, 'Ends the program'),
    (17, 'Declares a variable'),
    (17, 'Prints to the console'),
    (18, 'function (a, b) -> a + b'),
    (18, 'const add = (a, b) => a + b;'),
    (18, 'add(a, b) = a + b;'),
    (18, 'lambda add(a, b): a + b');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 7 (Arrays)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('What is an Array?', 'An array is an ordered list of values. In JavaScript: const fruits = ["apple", "banana", "cherry"]; Access items by index starting at 0.', 1, 7),
    ('Array Methods', 'Common array methods: push() adds an item, pop() removes the last, length returns the count, indexOf() finds an element.', 2, 7),
    ('Iterating over Arrays', 'Use a for loop or the forEach() method to iterate over arrays. Example: fruits.forEach(f => console.log(f));', 3, 7);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What index does the first element of an array have?', 0, 19),
    ('Which method adds an element to the END of an array?', 2, 20),
    ('Which method iterates over each element of an array?', 3, 21);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (19, '0'),
    (19, '1'),
    (19, '-1'),
    (19, 'first'),
    (20, 'shift()'),
    (20, 'prepend()'),
    (20, 'push()'),
    (20, 'append()'),
    (21, 'map()'),
    (21, 'filter()'),
    (21, 'find()'),
    (21, 'forEach()');

-- ============================================================
-- Lessons and Exercises: Course 1, Section 8 (Objects and OOP)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('What is an Object?', 'An object groups related data and behavior. Example: const person = { name: "Bruno", age: 25 }; Access with dot notation: person.name.', 1, 8),
    ('Object Methods', 'Objects can have methods (functions). Example: const car = { brand: "Toyota", start: function() { return "Vroom!"; } };', 2, 8),
    ('Introduction to Classes', 'Classes are blueprints for objects. Syntax: class Animal { constructor(name) { this.name = name; } speak() { return "..."; } }', 3, 8);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('How do you access the name property of an object called person?', 1, 22),
    ('What is a method in an object?', 0, 23),
    ('What keyword defines a class in JavaScript?', 2, 24);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (22, 'person[name]'),
    (22, 'person.name'),
    (22, 'person->name'),
    (22, 'person::name'),
    (23, 'A function that belongs to an object'),
    (23, 'A variable in an array'),
    (23, 'A loop inside another loop'),
    (23, 'An imported module'),
    (24, 'object'),
    (24, 'struct'),
    (24, 'class'),
    (24, 'blueprint');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 1 (Introduction to HTML) — sections 9-16
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('What is HTML?', 'HTML (HyperText Markup Language) is the standard language for creating web pages. It describes the structure of a page using elements and tags.', 1, 9),
    ('Basic HTML Tags', 'Common tags: <h1>–<h6> for headings, <p> for paragraphs, <a href=""> for links, <img src=""> for images.', 2, 9),
    ('Your First HTML Page', 'Every HTML page needs: <!DOCTYPE html>, <html>, <head> (with <title>), and <body>. Content goes inside <body>.', 3, 9);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What does HTML stand for?', 2, 25),
    ('Which tag creates a hyperlink?', 1, 26),
    ('Where does the visible content of an HTML page go?', 3, 27);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (25, 'Hyper Tool Markup Language'),
    (25, 'Hyperlink Text Markup Language'),
    (25, 'HyperText Markup Language'),
    (25, 'High Text Modern Language'),
    (26, '<link>'),
    (26, '<a>'),
    (26, '<href>'),
    (26, '<url>'),
    (27, 'Inside <head>'),
    (27, 'Inside <title>'),
    (27, 'Inside <script>'),
    (27, 'Inside <body>');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 2 (HTML Structure and Semantics)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Semantic HTML', 'Semantic tags describe the meaning of content: <header>, <nav>, <main>, <section>, <article>, <footer>. They improve accessibility and SEO.', 1, 10),
    ('Lists and Tables', 'Use <ul> for unordered lists, <ol> for ordered lists, and <li> for items. Tables use <table>, <tr>, <th>, and <td>.', 2, 10),
    ('Forms Basics', 'Forms collect user input: <form>, <input type="text">, <input type="password">, <button type="submit">, <label>.', 3, 10);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Which tag represents a navigation menu?', 0, 28),
    ('Which tag is used for an ordered list?', 2, 29),
    ('Which input type is used for passwords?', 1, 30);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (28, '<nav>'),
    (28, '<menu>'),
    (28, '<header>'),
    (28, '<section>'),
    (29, '<ul>'),
    (29, '<dl>'),
    (29, '<ol>'),
    (29, '<list>'),
    (30, 'type="text"'),
    (30, 'type="password"'),
    (30, 'type="hidden"'),
    (30, 'type="secret"');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 3 (Introduction to CSS)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('What is CSS?', 'CSS (Cascading Style Sheets) controls the visual presentation of HTML elements: colors, fonts, spacing, layout, and more.', 1, 11),
    ('Selectors and Properties', 'Target elements with selectors: tag (p), class (.my-class), ID (#my-id). Apply styles with property: value; pairs.', 2, 11),
    ('Colors and Fonts', 'Set colors with color and background-color. Use font-family, font-size, and font-weight to style text.', 3, 11);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What does CSS stand for?', 3, 31),
    ('Which selector targets an element with class "box"?', 1, 32),
    ('Which CSS property changes text color?', 0, 33);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (31, 'Computer Style Sheets'),
    (31, 'Creative Style Syntax'),
    (31, 'Colorful Site Styles'),
    (31, 'Cascading Style Sheets'),
    (32, '#box'),
    (32, '.box'),
    (32, 'box'),
    (32, '*box'),
    (33, 'color'),
    (33, 'text-color'),
    (33, 'font-color'),
    (33, 'foreground');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 4 (CSS Box Model and Layout)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('The Box Model', 'Every HTML element is a box. The box model consists of: content, padding (inside), border, and margin (outside).', 1, 12),
    ('Padding and Margin', 'padding adds space inside the element boundary. margin adds space outside. Both can be set individually: top, right, bottom, left.', 2, 12),
    ('Display and Position', 'display: block takes full width. display: inline flows inline. position: relative, absolute, fixed, and sticky control placement.', 3, 12);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('What is the correct order of the CSS box model from inside to outside?', 2, 34),
    ('Which property adds space INSIDE an element?', 0, 35),
    ('Which display value makes an element a block-level element?', 1, 36);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (34, 'margin > border > padding > content'),
    (34, 'content > margin > border > padding'),
    (34, 'content > padding > border > margin'),
    (34, 'border > padding > content > margin'),
    (35, 'padding'),
    (35, 'margin'),
    (35, 'gap'),
    (35, 'spacing'),
    (36, 'inline'),
    (36, 'block'),
    (36, 'flex'),
    (36, 'grid');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 5 (Flexbox and Grid)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Introduction to Flexbox', 'Flexbox is a layout model. Set display: flex on a container. Use justify-content to align horizontally, align-items vertically.', 1, 13),
    ('Flexbox Properties', 'flex-direction rows or columns, flex-wrap allows wrapping, gap adds spacing between items, flex-grow/shrink control sizing.', 2, 13),
    ('CSS Grid Basics', 'CSS Grid creates two-dimensional layouts. Set display: grid. Use grid-template-columns to define columns. Example: grid-template-columns: 1fr 1fr 1fr;', 3, 13);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Which CSS property activates Flexbox on a container?', 2, 37),
    ('Which property aligns flex items along the MAIN axis?', 0, 38),
    ('What unit is used in CSS Grid to represent a fraction of available space?', 3, 39);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (37, 'layout: flex'),
    (37, 'align: flex'),
    (37, 'display: flex'),
    (37, 'flex: on'),
    (38, 'justify-content'),
    (38, 'align-items'),
    (38, 'flex-direction'),
    (38, 'align-content'),
    (39, 'px'),
    (39, '%'),
    (39, 'em'),
    (39, 'fr');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 6 (JS in the Browser)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Including JavaScript in HTML', 'Use the <script> tag to add JavaScript. Place it before </body> for best performance. External: <script src="script.js"></script>', 1, 14),
    ('The window and document Objects', 'The browser exposes window (global context) and document (the HTML page). Use document to access and modify HTML elements.', 2, 14),
    ('console and alert', 'console.log() prints to developer tools. alert() shows a popup. prompt() collects user input. confirm() asks yes/no.', 3, 14);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Where should the <script> tag be placed for best performance?', 1, 40),
    ('Which object represents the HTML document in the browser?', 2, 41),
    ('Which function shows a popup dialog box?', 0, 42);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (40, 'Inside <head>'),
    (40, 'Before </body>'),
    (40, 'Before <html>'),
    (40, 'After </html>'),
    (41, 'window'),
    (41, 'browser'),
    (41, 'document'),
    (41, 'page'),
    (42, 'alert()'),
    (42, 'console.log()'),
    (42, 'prompt()'),
    (42, 'confirm()');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 7 (DOM Manipulation)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Selecting Elements', 'Use document.getElementById("id") or document.querySelector(".class") to select elements from the DOM.', 1, 15),
    ('Changing Content and Style', 'Change text with element.textContent = "new text". Change HTML with element.innerHTML. Change styles with element.style.color = "red".', 2, 15),
    ('Creating and Removing Elements', 'Create: document.createElement("div"). Add to page: parent.appendChild(child). Remove: parent.removeChild(child).', 3, 15);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Which method selects an element by its ID?', 0, 43),
    ('Which property changes the visible text of an element?', 2, 44),
    ('Which method adds a child element to a parent?', 1, 45);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (43, 'document.getElementById()'),
    (43, 'document.querySelector()'),
    (43, 'document.getElement()'),
    (43, 'document.selectId()'),
    (44, 'element.innerHTML'),
    (44, 'element.value'),
    (44, 'element.textContent'),
    (44, 'element.innerText'),
    (45, 'document.createElement()'),
    (45, 'parent.appendChild()'),
    (45, 'parent.addChild()'),
    (45, 'parent.insertElement()');

-- ============================================================
-- Lessons and Exercises: Course 2, Section 8 (Events and Forms)
-- ============================================================
INSERT INTO tb_lessons (title, theory_content, list_order, section_id) VALUES
    ('Event Listeners', 'Attach events with addEventListener. Example: button.addEventListener("click", () => { alert("Clicked!"); });', 1, 16),
    ('Form Validation with JavaScript', 'Read input values with input.value. Check conditions and show errors in the page instead of using alert for better UX.', 2, 16),
    ('Preventing Default Behavior', 'Use event.preventDefault() to stop default browser actions, like preventing a form from submitting and refreshing the page.', 3, 16);

INSERT INTO tb_exercises (question, correct_answer, lesson_id) VALUES
    ('Which method attaches an event to a DOM element?', 3, 46),
    ('How do you read the value typed by a user in an input field?', 1, 47),
    ('What does event.preventDefault() do?', 0, 48);

INSERT INTO tb_exercises_options (exercise_id, options) VALUES
    (46, 'element.on("click")'),
    (46, 'element.onClick()'),
    (46, 'element.bindEvent()'),
    (46, 'element.addEventListener()'),
    (47, 'input.text'),
    (47, 'input.value'),
    (47, 'input.content'),
    (47, 'input.data'),
    (48, 'Stops the default browser action for the event'),
    (48, 'Prevents JavaScript from running'),
    (48, 'Removes the event listener'),
    (48, 'Reloads the page');
