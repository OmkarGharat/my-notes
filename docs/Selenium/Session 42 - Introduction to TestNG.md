TestNG

### 🧪 TestNG Notes (Corrected + Clear Version)

-   In TestNG, we **do not use the** `main` **method**.
    
-   You need to create **test methods** in TestNG depending on how many steps are required to execute the test case.
    
-   To execute a test method, you must use the `@Test` **annotation** on top of it.
    
-   By default, **TestNG executes test methods in alphabetical order**.
    
-   To override the alphabetical execution, use the `priority` **parameter in the** `@Test` **annotation**.  
    Example: `@Test(priority = 1)`
    
-   If you do **not set any priority**, TestNG assigns a **default priority of** `0`.
    
-   If multiple test methods have the **same priority**, then TestNG will again execute them in **alphabetical order**.
    
-   You can also provide **negative numbers as priority values**. (e.g., `priority = -1`).
    
-   TestNG will execute **only those methods which have the** `@Test` **annotation**.
    
-   If **all** `@Test` **annotations are removed or commented**, and you try to run the script, it will show:  
    `"No tests found. Nothing was run."`
    

---

### 🔢 Execution Order Summary

1.  TestNG executes test methods **in alphabetical order** by default.
    
2.  `@Test(priority = <number>)` controls the execution order.
    
3.  If you provide priority, then **alphabetical order is ignored**.
    
4.  Priorities can be **random numbers** (they need **not be sequential**).
    
5.  Default priority is **0** if not specified.
    
6.  If priorities are the same, TestNG follows **alphabetical order**.
    
7.  ✅ **Negative values are allowed** in priorities.
    
8.  Only methods annotated with `@Test` will be executed.
    

---

### 📄 Creating a Test Suite in TestNG

-   To generate a **TestNG XML suite**,  
    Right-click on the package where all test cases are present → `TestNG` → `Convert to TestNG` → `Finish`.
    
-   It generates an XML file (test suite) used to:
    
    -   Run tests in **cross-browser** environments.
        
    -   Run **multiple tests simultaneously** (parallel execution).
        

---

### 📊 Viewing Reports

-   To view the TestNG report for the **first time**, refresh the **Selenium WebDriver project**.
    
-   After each test execution, refresh the `test-output` **folder** to see the updated report.
    

---

### ✅ Bonus Suggestions:

-   Try to mention that `@BeforeMethod` and `@AfterMethod` can be used for setup and cleanup before/after each test method.
    
-   You can also use `dependsOnMethods` for controlling test dependencies.
    

---