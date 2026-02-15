Javascript Executor

![1688903209642-20250319-193634.jfif](attachments/13336593/13336603.jfif?width=760)

---

### **✔ Corrected Explanation of JavaScriptExecutor Architecture**

1️⃣ `JavascriptExecutor` **is an interface.**

-   यामध्ये JavaScript execute करण्यासाठी `executeScript()` आणि `executeAsyncScript()` या दोन methods असतात.
    

2️⃣ `WebDriver` **is an interface.**

-   हे **browser automation साठी main interface आहे.**
    
-   `RemoteWebDriver` **हा** `WebDriver` **ला implement करतो.**
    

3️⃣ `RemoteWebDriver` **is a class.**

-   **ही class** `WebDriver`**,** `JavascriptExecutor`**, आणि** `TakesScreenshot` **या तीनही interfaces implement करते.**
    
-   याचा अर्थ `RemoteWebDriver` ही class **browser control, JavaScript execution, आणि screenshots handle करू शकते.**
    

4️⃣ `ChromiumDriver` **is a class.**

-   **ChromiumDriver** ही `RemoteWebDriver` ची subclass आहे.
    
-   **हे Edge आणि Chrome दोन्ही drivers साठी common base class आहे.**
    

5️⃣ `ChromeDriver` **आणि** `EdgeDriver`

-   हे दोन्ही `ChromiumDriver` **वर आधारित आहेत.**
    
-   **त्यामुळे** `JavascriptExecutor` **चे features हे Chrome आणि Edge मध्येही काम करतात.**
    

---

### **✔ Correct Hierarchy (Proper Tree Structure)**

WebDriver (Interface)
    ↑
RemoteWebDriver (Class) → implements WebDriver, JavascriptExecutor, TakesScreenshot
    ↑
ChromiumDriver (Class)
    ↑
ChromeDriver (Class)    ,   EdgeDriver (Class)

---

### **✔ Key Fixes in Your Draft**  
✅ `RemoteWebDriver class implemented JavascriptExecutor` ✅ → **Correct**  
✅ `JavascriptExecutor is implemented by RemoteWebDriver class along with WebDriver` ✅ → **Correct**  
✅ `RemoteWebDriver has 3 parents: WebDriver, TakeScreenshot, and JavascriptExecutor` ✅ → **Correct**

---

### **🔥 Final Takeaway**

**JavascriptExecutor हा RemoteWebDriver मध्ये implement झालेला असतो.** त्यामुळे **जो कोणी RemoteWebDriver extend करतो (उदा. ChromeDriver, EdgeDriver), तो JavascriptExecutor सुद्धा वापरू शकतो.** 🚀

---

When you perform .click() it will internally executing js code because only through js, we can interact with webElements. Because the webElements are designed using HTML and the actions are designed using js.

.getText() is not an action method.

.click() sendkeys() are action Methods.

.get() methods are not action methods

What do you mean by

RemoteWebDriver has implemented 3 interfaces ??

WHat is implemented by ?

What is implemented and implementation ?

What are action Methods ?

Which methods are action methods and which are not ? Can you give me its complete list ?

ElementInterceptedException you will get only on Radio buttons, checkboxes and on Input boxes.

for sendkeys and click() ElementInterceptedException may come so use **JavascriptExecutor.**

We cannot use new keyword and cannot create object, because JavascriptExecutor is an interface.

variable of **JavascriptExecutor** \= Object of ChromeDriver

**variable of Parent Interface = Object of ChromeDriver → Upcasting**

Q. JavascriptExecutor js = (JavascriptExecutor) driver;

Amu ithe aapan cast ka kela mala nahi samajla

Amu mi ithe youtube var pavan kumar che videos baghun shiktoy tar tyaat to bolla ki fakta input boxes, checkboxes aani radio buttons varach ElementClickInterceptedException yeto, pan yaatlya pratyek element var nehmi yet nahi, I mean kadhi yeto kadhi nay yet asa ka amu ?

mg kay nehmich JavascriptExecutor vaapaycha ka ?

If you use

WebDriver driver = new ChromeDriver();

then you need to do **upcasting** when you are creating the object of **JavascriptExecutor**

But if you use

ChromeDriver driver = new ChromeDriver();

because object of **ChromeDriver** class can directly store into the variable of **JavascriptExecutor.**

Because **JavascriptExecutor** is the parent of **ChromeDriver** class.

We do upcasting since there is no relation between **RemoteWebDriver** class and **JavascriptExecutor interface**

JavascriptExecutor vs normal methods like (.sendKeys() and .click())

which is better ?

Give me their overall comparison.

In Selenium, when you use `.sendKeys()` twice on the same file input element, the second file will replace the first one. This happens because most file input fields (`<input type="file">`) do not allow multiple files to be appended unless the `multiple` attribute is present and explicitly supported by the browser.

How to upload multiple files simultaneously without using .sendKeys() ?

Amu mi youtube var pavan kumar che videos baghun shiktoy tar tyaat to bolla ki fakta input boxes, checkboxes aani radio buttons varach ElementClickIntercepted exception yeto… pan ekach element var kadhi yeto kadhi nahi yet… Asa ka ? and mg sarva input boxes, chekboxes aani sarva radiobuttons var JavaScriptExecutor vaapraycha ka ki jya elemennt var yetoy tyavarach… pan mg he kasa samjel ki kon exception fekel aani kon nahi ?

## Code 1

driver.get("https://testautomationpractice.blogspot.com/");


WebElement inputbox = driver.findElement(By.xpath("//input\[@id='name'\]"));
		
JavascriptExecutor js = (JavascriptExecutor) driver;
js.executeScript("arguments\[0\].setAttribute('value', 'John')", inputbox);

## Code 2

driver.get("https://testautomationpractice.blogspot.com/");

WebElement radioBtn = driver.findElement(By.xpath("//input\[@id='male'\]"));
JavascriptExecutor js = (JavascriptExecutor) driver;
js.executeScript("arguments\[0\].click()", radioBtn);		

## Code 3

driver.get("https://testautomationpractice.blogspot.com/");

JavascriptExecutor js = (JavascriptExecutor) driver;
js.executeScript("return window.scrollBy(0,1500)", "");

## Code 4

driver.get("https://testautomationpractice.blogspot.com/");

JavascriptExecutor js = (JavascriptExecutor) driver;
WebElement elem = driver.findElement(By.xpath("//h2\[normalize-space()='Static Web Table'\]"));
js.executeScript("return arguments\[0\].scrollIntoView();", elem);

## Code 5

driver.get("https://testautomationpractice.blogspot.com/");

JavascriptExecutor js = (JavascriptExecutor) driver;

// Scroll page till end of page
js.executeScript("window.scrollBy(0, document.body.scrollHeight)");

// Scrolling upto intial position
js.executeScript("window.scrollBy(0, -document.body.scrollHeight)");

// zoom in zoom out
js.executeScript("document.body.style.zoom='150%'");
// NOTE : If zoom % is less than 100 then its zoom out if greater than 100 then zoom in. 

## Code 6

String path1 = "C:\\\\Users\\\\Amruta\\\\Pictures\\\\\_df11513b.avif";
String path2 = "C:\\\\Users\\\\Amruta\\\\Pictures\\\\\_212ab1c7.jpg";
driver.findElement(By.id("singleFileInput")).sendKeys(path1);

WebElement singleBtn = driver.findElement(By.xpath("//button\[normalize-space()='Upload Single File'\]"));
singleBtn.click();