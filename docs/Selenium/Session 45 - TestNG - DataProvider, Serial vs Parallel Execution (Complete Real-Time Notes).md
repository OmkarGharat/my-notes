### 🔹 **What is @DataProvider?**

-   `@DataProvider` is a **TestNG annotation** used for **data-driven testing**.
    
-   It allows you to **pass multiple sets of data** to the same test method.
    

#### 🧪 **Where is it used?**

-   Commonly used in:
    
    -   **Web automation (Selenium)**
        
    -   **API Testing**
        
    -   **Cross Browser Testing**
        
    -   **Form validations with different data**
        
    -   **Data-driven business scenarios (ERP, Banking, Insurance)**
        

#### ❓ **Why should we use it?**

1.  🔁 **Reduces code duplication** – one test logic, many inputs.
    
2.  🔧 **Better maintainability** – change data in one place.
    
3.  📊 **Scalability** – easily expand to more datasets.
    
4.  ✅ **No hardcoding** – industry standard discourages hard-coded test data.
    

---

### 🔹 **@DataProvider Method - Technical Details**

Property

Detail

**Return Type**

`Object[][]` (2D Object array)

**Access Modifier**

No need to specify (default)

**Annotation**

`@DataProvider(name="...")`

**Attribute in Test**

`@Test(dataProvider = "name")`

**Execution Count**

The test will run **once per dataset row**

---

### 🔹 **Data Sources in Real-Time Projects**

1.  **Excel File (Most Common)**
    
    -   Import using Apache POI or ExcelUtils.
        
    -   Data stored as `Object[][]` array.
        
    -   ❌ Hardcoded data not recommended.
        
2.  **Database (MySQL, Oracle)**
    
    -   Export to Excel first or fetch via JDBC.
        
    -   Makes tests dynamic & real-time.
        
3.  **JSON Files**
    
    -   Used in **API testing**, rarely in web UI tests.
        
4.  **CSV Files, YAML, XML** – Optional based on project.
    

---

### 🤔 **Can Two @DataProvider Methods Have the Same Name?**

-   ❌ No. Duplicate names are **not allowed** within the same class.
    
-   ✅ Can be same if defined in different classes, and used carefully.
    

---

### 🎯 **Advanced Attribute –** `indices`

@DataProvider(indices = {0, 3})

-   Runs test with only 0th and 3rd set.
    
-   **Not a range!** Just selected index positions.
    

---

## 🧪 **Serial vs Parallel Testing in TestNG**

---

### 🔹 **Serial Execution (Default)**

-   Only **one thread** is used.
    
-   Tests run **one after another**.
    
-   ✅ Good for debugging or when tests depend on each other.
    

#### 💡 Example:

<test name="SerialTest">
  <!-- No thread-count, no parallel attribute -->
</test>

---

### 🔹 **Parallel Execution (Performance Testing, Fast Results)**

#### 🔧 How?

In `testng.xml`, set:

<test name="ParallelTest" parallel="classes" thread-count="3">

#### 📊 Levels of Parallel Execution:

Level

parallel="..."

Description

**Tests**

`parallel="tests"`

Executes entire `<test>` blocks in parallel

**Classes**

`parallel="classes"`

Executes all classes in parallel

**Methods**

`parallel="methods"`

Executes all test methods in parallel

#### 🧵 **What is** `thread-count`**?**

-   No. of parallel threads to run.
    
-   Recommended:
    
    -   **Min = 2**
        
    -   **Max = 5** (More than that → performance issue)
        

#### ⚠️ **Tip:**

Even if you write `parallel="tests"`, it won't work unless `thread-count > 1` is set.

---

### 💎 **God Amu's Industry-Level Secrets & Tips**

---

#### 💡 **Real Use Case Example (ERP Form Testing)**:

> Suppose you're testing a Sales Order form with 10 different discount slabs.  
> Instead of writing 10 separate test methods, you write **one test with DataProvider** and pass all slabs via Excel file.

---

#### 💡 **Secret Tip 1: Group + DataProvider Combo**

@Test(dataProvider = "data", groups = {"smoke"})

-   Use **groups** + DataProvider together to create dynamic test suites.
    

---

#### 💡 **Secret Tip 2: Retry + DataProvider**

-   Use retry logic to re-run failed tests with same data:
    

@RetryAnalyzer(value = RetryLogic.class)

---

#### 💡 **Secret Tip 3: Parallel Tests on Different Browsers**

<parameter name="browser" value="chrome"/>
<parameter name="browser" value="firefox"/>

-   Run same test cases in parallel on **Chrome, Firefox, Edge** using DataProvider.
    

---

#### 💡 **Secret Tip 4: Use Custom DataProviderUtils**

-   Create a utility class for reusable DataProvider methods (like ExcelReader).
    
-   ✅ Modular code
    
-   ✅ Reuse across multiple test classes
    

---

### 🧠 **Quick Recap – Why DataProvider Rocks**

-   ✅ Automates repetitive input testing
    
-   ✅ Perfect for Regression Suites
    
-   ✅ No hardcoded data
    
-   ✅ Faster Execution with Parallelism
    
-   ✅ Easy to integrate with Excel/DB/JSON
    

---

ओमू, हे notes तू एका झटक्यात सांगू शकतोस कुठल्याही interview मध्ये, किंवा आपल्या testing framework मध्ये plug करू शकतोस without headache.