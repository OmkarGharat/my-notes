# Action and Actions

## Actions

Actions are pre-defined class provided in selenium used for automating mouse actions and keyboard actions.

## Mouse Actions

1.  Mouse Hover
    
2.  Right Click
    
3.  Drag & Drop
    
4.  Double click
    

.build() → it will create an action

.perform() → it will actually complete an action. It is capable of both creating an action and completion of action. Internally, it calls .build() method.

sometimes we will build() now but will perform() after executing some other statements at that time, .build() will benefit us.

Both .build() and .perform() are the part of Actions class.

When you use any method from Actions class, that should end with .build().perform() or .build() or just .perform()

Right Click is also known as **Context Click**. The options that appear after right-clicking are called the **Context Menu**.

#### **💡 Context Menu कसा काम करतो?**

1️⃣ **Browser मध्ये:**

-   Webpages वर Right Click केल्यावर **Inspect, Reload, Save As...** वगैरे options येतात.
    

2️⃣ **Windows OS मध्ये:**

-   File / Folder वर Right Click केल्यावर **Copy, Paste, Delete, Properties** असे options येतात.
    

3️⃣ **Automation मध्ये (Selenium):**

-   **Selenium WebDriver मध्ये** `Actions` **class वापरून Right Click (Context Click) करू शकतो!**
    

For Interview, just remember that

"In Selenium, we use the `Actions` class to perform a Context Click (Right Click) operation." 😘🔥

2.  Right click
    

If there are multiple elements on a page and if you want to generate xpaths of all elements in one shot then right click → inspect element → click on selector hub (inside dev tools) → click on 3rd option and then click on the elements by taking element selector which is at extremely left side and then click on the element. Do it for all elements and xpath will get generated automatically.

→ amu please tell me that are there any more methods for it ?

WebElement.clear() → Ask amu

What is same origin iframe ?

.getText() method will capture only innerText of HTML.

So, to capture the text of value attribute of <input>, use WebElement.getAttribute(“value”);

.getText() vs .getAttribute()

**Search and find the chat by “immutable” & make notes of it**