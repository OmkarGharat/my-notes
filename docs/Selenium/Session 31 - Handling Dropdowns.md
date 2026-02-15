## Types of Dropdowns

Select dropdown

Bootstrap dropdown

Hidden Dropdown

In <select> dropdown, every <option> is a webelement

There are 3 methods to choose option from dropdown (only for <select> dropdowns.

.selectByVisibleText(“…”);

.selectByValue(“…”);

.selectByIndex(<index-no>);

.

.

.

.

There are two ways to inspect hidden elements (options) of dropdown (as far as I know)

## Method 1

To view hidden options in a dropdown, we can use the following method...

1.  **Open Inspect Element** (Right-click on the page and select "Inspect" or press `F12`).
    
2.  **Select SelectorHub** from the available developer tools.
    
3.  Locate the **4th option from the extreme right** within SelectorHub (which is "Turn on Debugger") and click on it.
    
4.  Within **5 seconds**, click on the **hidden dropdown** to inspect its elements.
    

This will help to interact with hidden dropdown options effectively. 😊

now, you can see hidden elements in html

## Method 2

To view hidden options in a dropdown, we can also use the following method...

-   go to inspect elements
    
-   go to Event Listeners
    
-   in that expand the section of resize and then there is option named as "blur". just remove that field...
    

Here’s how you can remove the **blur** event listener using the DevTools:

### Steps:

1.  **Open Inspect Element** (`Right-click` on the page → Click **Inspect** or press `F12`).
    
2.  Go to the **Event Listeners** tab.
    
3.  Find and expand the **resize** section.
    
4.  Locate the **blur** event under it.
    
5.  Click the **Remove** button next to the **blur** event to disable it.
    

If there’s no remove button, you can also do it manually in the **Console** by running:

window.removeEventListener('blur', someFunction);

Let me know if you need more help! 😊

Note that the above is written by CHATGPT and its incomplete. Find what is **someFunction**

What is the difference between <**select**\> dropdowns, **bootstrap dropdowns** and **hidden dropdowns ?**