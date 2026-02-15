## 🧠 **Page Object Model (POM) — Concept Summary**

### ✅ **What is POM?**

-   **POM म्हणजे Framework नाही**, तो एक **Design Pattern** आहे.
    
-   POM चा उपयोग आपण Web elements आणि त्यांच्यावर होणाऱ्या actions व्यवस्थित वेगळं ठेवण्यासाठी करतो.
    
-   यामध्ये प्रत्येक web page साठी एक **Java class** तयार केली जाते — जी त्या page चे locators आणि action methods contain करते.
    

---

## 🧩 **Structure of POM Class**

हर एक POM class मध्ये खालील 3 भाग असतात:

1.  **Locators** → WebElements शोधायला
    
2.  **Constructor** → Driver inject करायला
    
3.  **Action Methods** → WebElement वर .click(), .sendKeys() वगैरे actions perform करायला
    

public class LoginPage {
    WebDriver driver; // global driver

    // Constructor
    public LoginPage(WebDriver driver) {
        this.driver = driver;
    }

    // Locator
    By username = By.xpath("//input\[@name='username'\]");

    // Action Method
    public void enterUsername(String user) {
        driver.findElement(username).sendKeys(user);
    }
}

---

## 🧭 **Step-by-Step Process (Without PageFactory)**

1.  **प्रत्येक Page साठी एक Page Object Class** तयार करायची (LoginPage, HomePage etc.)
    
2.  त्या class मध्ये त्या page चे Locators लिहायचे.
    
3.  प्रत्येक locator साठी त्याचा एक **action method** तयार करायचा.
    
4.  **Constructor मध्ये driver pass** करायचा.
    
5.  Test class मध्ये त्या Page class चा object create करून test case लिहायचा.
    

---

## 🛠️ **Locators कसे शोधायचे - SelectorHub Shortcut**

1.  Webpage वर `F12` दाबून DevTools उघड.
    
2.  `>>` क्लिक करून **SelectorHub** tab उघड.
    
3.  डावीकडे असलेला **"Select element"** arrow क्लिक करून element select कर.
    
4.  SelectorHub मध्ये **"click to generate locators Page and multiple Selectors"** क्लिक कर.
    
5.  सर्व locators तयार झाल्यावर, `Copy All` वर क्लिक करून ते code मध्ये paste कर.
    

➡️ Final output असं दिसेल:

By username = By.xpath("//input\[@name='username'\]");
By password = By.xpath("//input\[@name='password'\]");
By loginBtn = By.xpath("//button\[@type='submit'\]");

---

## ⚙️ **POM with PageFactory**

### 🔧 What is PageFactory?

-   `PageFactory` ही Selenium ची एक utility आहे जी locators ला initialize करते आणि कोड neat ठेवते.
    
-   आपण `@FindBy` annotation वापरतो आणि `PageFactory.initElements()` ने initialize करतो.
    

### 💡 Example:

public class LoginPage {
    WebDriver driver;

    // Constructor
    public LoginPage(WebDriver driver) {
        this.driver = driver;
        PageFactory.initElements(driver, this); // initialize all @FindBy
    }

    // Locators using @FindBy
    @FindBy(xpath = "//input\[@name='username'\]")
    WebElement username;

    @FindBy(xpath = "//input\[@name='password'\]")
    WebElement password;

    @FindBy(xpath = "//button\[@type='submit'\]")
    WebElement loginBtn;

    // Action Methods
    public void enterUsername(String user) {
        username.sendKeys(user);
    }

    public void enterPassword(String pass) {
        password.sendKeys(pass);
    }

    public void clickLogin() {
        loginBtn.click();
    }
}

---

## 🔬 **Test Class (TestNG Class)**

> TestNG class मध्ये **फक्त test methods + validation/assertions** असतात. PageObject class मध्ये कुठलंच validation ठेवायचं नाही.

public class LoginTest {
    WebDriver driver;

    @BeforeMethod
    public void setup() {
        driver = new ChromeDriver();
        driver.get("https://example.com/login");
    }

    @Test
    public void testValidLogin() {
        LoginPage login = new LoginPage(driver);
        login.enterUsername("admin");
        login.enterPassword("admin123");
        login.clickLogin();
        // Add validation/assertion here
    }
}

---

## 📝 **Important Points Recap**

-   ✅ POM is **not a framework**, it is a **design pattern**.
    
-   ✅ Create separate **Page class for each screen/page**.
    
-   ✅ Page class = Locators + Constructor + Action methods.
    
-   ❌ Page class should not contain **test cases or validations**.
    
-   ✅ Test class = Only test logic & validations.
    
-   ✅ With PageFactory → use `@FindBy`, `PageFactory.initElements()`
    
-   ❌ You don’t add PageObject classes in `testng.xml` file. Only Test classes are added there.
    

---

## हो ना ओमकार! आता खाली मी **"Without PageFactory"** वापरून Page Object Model (POM) कसा implement करायचा, ते संपूर्ण format मध्ये दिलंय — सगळ्या pointwise explanation सोबत, अगदी आपल्या style मध्ये — **मराठी + English** mix.

---

## 💻 **🔧 POM without PageFactory — Full Notes**

### ✅ Basic Idea:

-   इथे आपण **PageFactory वापरत नाही**.
    
-   Locators define करण्यासाठी `By` class वापरतो.
    
-   WebElement access करताना `driver.findElement(locator)` वापरतो.
    
-   Each page = एक class → Locators + Constructor + Action methods
    

---

### 🏗️ Page Object Class Structure (Without PageFactory):

public class LoginPage {
    WebDriver driver;

    // ✅ Constructor (inject driver)
    public LoginPage(WebDriver driver) {
        this.driver = driver;
    }

    // 🔍 Locators
    By usernameField = By.xpath("//input\[@name='username'\]");
    By passwordField = By.xpath("//input\[@name='password'\]");
    By loginBtn = By.xpath("//button\[@type='submit'\]");

    // 🧠 Action Methods
    public void enterUsername(String user) {
        driver.findElement(usernameField).sendKeys(user);
    }

    public void enterPassword(String pass) {
        driver.findElement(passwordField).sendKeys(pass);
    }

    public void clickLogin() {
        driver.findElement(loginBtn).click();
    }
}

---

### 🧪 Test Class (with TestNG):

public class LoginTest {
    WebDriver driver;

    @BeforeMethod
    public void setup() {
        driver = new ChromeDriver();
        driver.manage().window().maximize();
        driver.get("https://example.com/login");
    }

    @Test
    public void testLoginValidCredentials() {
        LoginPage login = new LoginPage(driver);
        login.enterUsername("admin");
        login.enterPassword("admin123");
        login.clickLogin();
        // validation/assertion इथे करायचा
    }

    @AfterMethod
    public void tearDown() {
        driver.quit();
    }
}

---

### 🧠 Breakdown in Marathi + English:

Component

Description (मराठीतून समजावलेलं)

`By` Locators

Web element शोधण्यासाठी वापरतात. उदा: `By.xpath(...)`

Constructor

Driver ला class मध्ये inject करतो. Without PageFactory, ही step manually करावी लागते.

Action Methods

वेगवेगळ्या actions (`click()`, `sendKeys()`) वेगळ्या method मध्ये लिहायच्या.

`driver.findElement(loc)`

प्रत्येक locator साठी manually element access करायचं.

---

### 📌 Advantages of Without PageFactory:

-   ✅ Code transparency — सगळं manually लिहितो म्हणून control आपल्याकडे असतो.
    
-   ✅ Beginners साठी perfect to understand internals of Selenium.
    

### ⚠️ Disadvantages:

-   ❌ Code lengthy होतो.
    
-   ❌ Element initialize repeat होतं (every time `findElement()` call).
    
-   ❌ Readability कमी असते large projects मध्ये.
    

---

### 🔁 Summary: POM Without PageFactory

Part

Description

Locator Format

`By username = By.xpath("...")`

Access Method

`driver.findElement(username)`

Setup

Constructor injects driver manually

Structure

Class = Constructor + Locators + Action Methods

---

**🥳 आता तुझ्याकडे दोन्ही version चे clear, formatted notes आहेत — PageFactory सोबत आणि Without PageFactory.**

**🔄 Comparison: Without vs With PageFactory**

**Feature**

**Without PageFactory**

**With PageFactory**

**Locator Declaration**

By username = By.xpath(...)

@FindBy(xpath="...")

**Element Access**

driver.findElement()

Direct object → username.sendKeys()

**Initialization**

No special method

Use PageFactory.initElements()

**Code Clarity**

Medium

High – More readable and clean

---