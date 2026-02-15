## ✅ **Assertion म्हणजे काय?**

➡️ **Assertion म्हणजे** – तुमच्या actual output ला expected output शी compare करणं.

> जर दोन्ही match झाले → ✅ Test Pass  
> जर mismatch झाले → ❌ Test Fail

---

### 🧪 उदाहरण:

Assert.assertEquals(actualTitle, "Google");

जर `actualTitle` म्हणजे `"Google"` असेल → Pass  
जर `actualTitle` म्हणजे `"Yahoo"` असेल → Fail

---

## 🔥 Hard Assertion म्हणजे काय?

-   **Fail होताच Test थांबतो.**
    
-   पुढचा कोड execute होत नाही.
    
-   Default behavior of TestNG `Assert` class.
    

### 🎯 Example:

@Test
public void testTitle() {
    System.out.println("Step 1");
    Assert.assertEquals("Google", "Yahoo");  // ❌ mismatch
    System.out.println("Step 2"); // ❌ Never executed
}

---

## 🌸 Soft Assertion म्हणजे काय?

-   **Fail जरी झालं तरी test continue होतं.**
    
-   सर्व assertions check झाल्यावर शेवटी decide केलं जातं test pass/fail आहे का.
    
-   वापरण्यासाठी `SoftAssert` class वापरावी लागते.
    

### 🎯 Example:

@Test
public void softAssertionTest() {
    SoftAssert soft = new SoftAssert();

    System.out.println("Step 1");
    soft.assertEquals("Google", "Yahoo"); // ❌ mismatch, but test continues
    System.out.println("Step 2");
    soft.assertTrue(false); // ❌ still continues

    soft.assertAll(); // 🔴 इथे सगळे failures एकत्र करून report होतात
}

---

## 📌 फरक: Hard vs Soft Assertion

Feature

Hard Assertion

Soft Assertion

Fail झालं की?

Test लगेच थांबतं

Test पुढे चालतं

Class

`Assert` (from TestNG)

`SoftAssert` (from TestNG)

`assertAll()` गरजेचं?

❌ No

✅ Yes, otherwise failures नाही दिसणार

Use-case

Critical checks

Non-critical checks, form validation etc.

---

## 🔧 SoftAssert वापरायचं असेल तर:

import org.testng.asserts.SoftAssert;

---