गोड ओमू, आता मी तुझं **Day 46: Test Outcomes + Listeners + Extent Reports** चे notes, पूर्णपणे **TestNG style**, industry-level clarity, **Marathi + English** भाषेत, **संपूर्ण detail** मध्ये लिहून देत आहे — एकदम तुझ्या "Day 45" च्या नोट्सच्या फॉर्मॅटसारखं.

---

# 📘 **Day 46 Notes – Test Outcomes, Listeners, and Extent Reports**

---

## 🧪 **Test Outcomes म्हणजे काय?**

### 👉 Test Case चे तीन possible outcomes असतात:

1.  ✅ **Pass** – Test सगळ्या expectations meet करतं.
    
2.  ❌ **Fail** – Test मध्ये काही assertion mismatch होतं.
    
3.  ⚠️ **Skipped** – काही कारणास्तव (e.g. dependency failure, conditions) test execute होत नाही.
    

---

## 🔁 **Post Actions म्हणजे काय?**

### 👉 Test run झाल्यानंतर जे actions perform होतात, त्यांना **Post Actions** म्हणतात.

उदा.:

-   Report बनवणे
    
-   Result update करणे
    
-   Screenshot attach करणे (failure scenario मध्ये)
    
-   Email notification पाठवणे
    

---

## 🔔 **Listeners म्हणजे काय?**

### 🎯 **Definition:**

Listeners हे असे classes असतात जे test life-cycle चे event ऐकतात आणि त्यावर action घेतात.

#### उदा.:

-   Test सुरू झालं की → `onTestStart()` execute होतो
    
-   Test पास झालं की → `onTestSuccess()`
    
-   Test fail झालं की → `onTestFailure()`
    
-   Test skip झालं की → `onTestSkipped()`
    

---

## 🧩 **ITestListener Interface Explained**

### 👉 TestNG मध्ये `ITestListener` नावाचं एक inbuilt interface आहे.

#### या Interface मध्ये खालील methods असतात:

public void onTestStart(ITestResult result)
public void onTestSuccess(ITestResult result)
public void onTestFailure(ITestResult result)
public void onTestSkipped(ITestResult result)
public void onStart(ITestContext context)
public void onFinish(ITestContext context)

---

## 🛠️ **Listener Class कशी तयार करायची?**

### ✨ दोन methods आहेत Listener implement करण्याच्या:

---

### 🅰️ **Method 1: Implementing ITestListener**

public class MyListener implements ITestListener {
    public void onTestSuccess(ITestResult result) {
        System.out.println("✅ Test Passed: " + result.getName());
    }

    public void onTestFailure(ITestResult result) {
        System.out.println("❌ Test Failed: " + result.getName());
    }
}

---

### 🅱️ **Method 2: Extending TestListenerAdapter**

public class MyListener extends TestListenerAdapter {
    @Override
    public void onTestSuccess(ITestResult result) {
        // override existing default implementation
    }
}

### 🤔 Confusion Solved:

> `TestListenerAdapter` already implements `ITestListener` internally. So जर तुला **सगळीच methods नकोत**, फक्त specific method override करायची आहे, तर `TestListenerAdapter` extend करणं चांगलं.

---

## 🗂️ **Listener attach कसा करायचा?**

### 1\. **Directly Java file मध्ये attach करण्यासाठी:**

@Listeners(myPackage.MyListener.class)
public class MyTest {
  // test methods
}

### 2\. `testng.xml` **मधून attach करण्यासाठी:**

<listeners>
  <listener class-name="myPackage.MyListener" />
</listeners>

### 💡 God Amu Secret Tip:

> जर test classes जास्त असतील (उदा. 50+), तर `@Listeners` प्रत्येक file ला देण्याऐवजी, **एकदाच** `testng.xml` **मध्ये listener declare करणं best practice** आहे.

---

## 🧾 **Listener वापरण्याचा Purpose**

🎯 **Main Purpose**: Post Action handle करणं

Post Action

Description

Report Generation

HTML / PDF reports

Result Status Update

PASS / FAIL / SKIPPED

Screenshot Attach

On failure

Email Notification

On suite finish

---

## 📊 **Extent Reports (Beautiful Reporting Tool)**

---

### 🔷 Overview:

**Extent Reports** हे एक advanced reporting library आहे जे test execution report visually attractive बनवतं.

---

### 🔑 **Main Classes:**

Class Name

Purpose

**ExtentSparkReporter**

UI settings (dark theme, standard, fonts, alignment)

**ExtentReports**

Metadata fill करतं (OS, Browser, Tester name, etc.)

**ExtentTest**

Each test case track करतो – pass/fail status + screenshot

---

### ✅ Extent Report Setup Steps:

1.  Add dependency in `pom.xml` (for Maven users):
    

<dependency>
  <groupId>com.aventstack</groupId>
  <artifactId>extentreports</artifactId>
  <version>5.0.9</version>
</dependency>

2.  Create Listener class and implement `ITestListener`.
    
3.  Initialize Extent Report in `onStart()` and flush in `onFinish()`:
    

public class MyListener implements ITestListener {
    ExtentReports extent;
    ExtentTest test;

    public void onStart(ITestContext context) {
        ExtentSparkReporter reporter = new ExtentSparkReporter("test-output/ExtentReport.html");
        reporter.config().setReportName("ERP Automation Report");
        reporter.config().setDocumentTitle("Test Results");

        extent = new ExtentReports();
        extent.attachReporter(reporter);
        extent.setSystemInfo("Tester", "Omkar");
    }

    public void onTestSuccess(ITestResult result) {
        test = extent.createTest(result.getName());
        test.pass("Test Passed");
    }

    public void onTestFailure(ITestResult result) {
        test = extent.createTest(result.getName());
        test.fail("Test Failed");
        // Screenshot logic if needed
    }

    public void onFinish(ITestContext context) {
        extent.flush();
    }
}

---

## ❓ **Common Doubts & Clarifications**

---

### ❓ _Q1: What are default methods in interface?_

🔹 Java 8 पासून, interface मध्ये **default methods** define करता येतात.  
🔹 पण तुम्ही class मध्ये त्यांना implement करताना, त्याचा access `public` ठेवावा लागतो.

---

### ❓ _Q2: onStart() vs onTestStart() difference?_

Method

When it Executes?

`onStart()`

Suite/Test level सुरू होतानाच

`onTestStart()`

Individual test सुरू होताना

---

### 🧪 Real Industry Example:

ERP System मधे large scale regression testing करताना – 500+ test cases आहेत.

-   आपण Listeners वापरून **pass/fail/skip tracking** करत आहोत.
    
-   Reports extend report मध्ये पाहिजे.
    
-   Fail झाल्यावर screenshot लागतो – So Listeners मध्ये screenshot capture logic टाकतो.
    
-   Report सर्व टीम members ना पाठवायला तयार!
    

---

## ✅ Summary:

Concept

Description

**Test Outcome**

Pass / Fail / Skipped

**Post Action**

Report, Screenshot, Email

**Listener Interface**

ITestListener (implements OR extends TestListenerAdapter)

**Integration**

via @Listeners or testng.xml

**Reporting**

Extent Report with 3 main classes

---