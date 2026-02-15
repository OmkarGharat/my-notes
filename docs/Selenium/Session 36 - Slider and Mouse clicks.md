.getLocation() → belongs to WebElement

.getLocation.getX() →

.getLocation.getY() →

Actions act = new Actions(driver);

act.dragAndDropBy(min-slide

There are 4 Types

1.  Slider Range
    
2.  Keyboard keys : Pressing two keys simultaneously
    
3.  Keyboard keys : Pressing three keys simultaneously
    
4.  Keyboard keys : Pressing Ctrl + click simultaneously
    

## 1\. Slider Range

WebDriver driver = new ChromeDriver();
driver.get("https://testautomationpractice.blogspot.com");

driver.manage().window().maximize();

WebElement left\_pointer = driver.findElement(By.xpath("//div\[@id='slider-range'\]/span\[1\]"));
WebElement right\_pointer = driver.findElement(By.xpath("//div\[@id='slider-range'\]/span\[2\]"));
System.out.println("Original Location of Left Pointer: " + left\_pointer.getLocation());
System.out.println("Original Location of Right Pointer: " + right\_pointer.getLocation());

Actions act = new Actions(driver);
act.dragAndDropBy(left\_pointer, 10, 0).build().perform();
act.dragAndDropBy(right\_pointer, -10, 0).build().perform();

System.out.println("New Location of Left Pointer: " + left\_pointer.getLocation());
System.out.println("New Location of Right Pointer: " + right\_pointer.getLocation());

## 2\. Keyboard keys : Pressing two keys simultaneously

`Actions act = new Actions(driver);`

`act.keyDown(Keys.CONTROL) --> Pressed Control Key`

`act.sendKeys("A") --> Pressed Key A / sent text A`

WebDriver driver = new ChromeDriver();

driver.manage().window().maximize();
WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(10)); // Explicit wait

driver.get("https://text-compare.com");
// TODO : The above website is the most useless website and it takes a hell lot of time to load in selenium chrome instance. Sometimes it has thrown Timeout exception as well.

var field1 = wait.until(ExpectedConditions.presenceOfElementLocated(By.xpath("//textarea\[@id='inputText1'\]")));
field1.sendKeys("Hello");

Actions act = new Actions(driver);

// press Ctrl + A
act.keyDown(Keys.CONTROL).sendKeys("A").keyUp(Keys.CONTROL).perform();
System.out.println("Control A Pressed");

// press Ctrl + C
act.keyDown(Keys.CONTROL).sendKeys("C").keyUp(Keys.CONTROL).perform();
System.out.println("Control C Pressed");

// press tab
act.keyDown(Keys.TAB).keyDown(Keys.CONTROL).perform();
System.out.println("TAB Pressed");

// press Ctrl + v
act.keyDown(Keys.CONTROL).sendKeys("V").keyDown(Keys.CONTROL).perform();
System.out.println("Control V Pressed");

## 3\. Keyboard keys : Pressing three keys simultaneously

Actions act = new Actions(driver);
act.keyDown(Keys.CONTROL)
   .keyDown(Keys.SHIFT)
   .sendKeys("C")
   .keyUp(Keys.SHIFT)  // Release SHIFT
   .keyUp(Keys.CONTROL) // Release CTRL
   .perform();

## 4\. Pressing Ctrl + Click simultaneously

Actions act = new Actions(driver);
WebElement submitBtn = driver.findElement(By.xpath("//button\[@id='submit'\]")); 
act.keyDown(Keys.CONTROL)
   .click(submitBtn)  // Now specifying the element to click
   .keyUp(Keys.CONTROL)
   .perform();

---

# **Should** I release both keys (`CTRL` and `SHIFT`) explicitly ?

### Why Both `keyUp(Keys.SHIFT)` and `keyUp(Keys.CONTROL)` Are Needed:

1.  **Selenium does not automatically release keys**
    
    -   When you press multiple keys using `keyDown()`, Selenium keeps them held down until explicitly released with `keyUp()`.
        
    -   If you only release one key, the other remains pressed, which may cause unexpected behavior in further actions.
        
2.  **Mimicking real user behavior**
    
    -   If a real user presses `CTRL + SHIFT + C`, they naturally lift both keys after performing the action.
        
    -   Keeping `SHIFT` or `CTRL` pressed unintentionally could interfere with subsequent inputs.
        

### Example of What Happens If You Don't Release Both:

-   If you release only `SHIFT` but not `CTRL`, the browser (or the webpage) might still think `CTRL` is pressed, affecting further actions like typing or clicking.
    

### Final Recommendation:

✅ **Always pair** `keyDown(KEY)` **with** `keyUp(KEY)` **for all modifier keys to avoid issues.**

### Correct Code:

Actions act = new Actions(driver);
act.keyDown(Keys.CONTROL)
   .keyDown(Keys.SHIFT)
   .sendKeys("C")
   .keyUp(Keys.SHIFT)  // Release SHIFT
   .keyUp(Keys.CONTROL) // Release CTRL
   .perform();

This ensures a proper **Ctrl + Shift + C** press and release sequence. 🚀