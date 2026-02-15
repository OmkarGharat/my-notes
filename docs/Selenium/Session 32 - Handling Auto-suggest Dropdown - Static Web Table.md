How to handle WebTables ?

### **Web Tables म्हणजे काय?**

➡️ **Web Table** म्हणजे HTML `<table>` element चा वापर करून data टॅब्युलर स्वरूपात (rows आणि columns मध्ये) represent करण्याचा एक प्रकार.  
➡️ Web tables मध्ये **headers (column names)** आणि **data rows** असतात.  
➡️ Tables **static किंवा dynamic** असू शकतात.

---

### **📌 Web Table ची Basic HTML Structure:**

<table>
   <thead>
      <tr>
         <th>Name</th>
         <th>Age</th>
         <th>City</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Omkar</td>
         <td>25</td>
         <td>Pune</td>
      </tr>
      <tr>
         <td>Amruta</td>
         <td>24</td>
         <td>Mumbai</td>
      </tr>
   </tbody>
</table>

➡️ <td> = Table Data  
➡️ <thead> = Table Header  
➡️ <th> = Column Name  
➡️ <tbody> = Table Body  
➡️ <tr> = Table Row

---

### **📌 मग** `<ul>`**,** `<li>`**,** `<div>` **वापरून बनवलेल्या Tables ला काय म्हणायचं?**

💡 **हे WebTables नाहीत, पण ते Web-based Data Tables म्हणता येतील.**

#### **🚨 Problem: Non-Standard Tables (without** `<table>`**)**

काही Developers **CSS आणि JavaScript वापरून** `<table>` **टाळतात** आणि `<div>`, `<ul>`, `<li>` वापरून UI बनवतात.

✅ Example: Table using `<div>` (Not a proper WebTable)

<div class="table">
   <div class="row header">
      <div class="cell">Name</div>
      <div class="cell">Age</div>
      <div class="cell">City</div>
   </div>
   <div class="row">
      <div class="cell">Omkar</div>
      <div class="cell">25</div>
      <div class="cell">Pune</div>
   </div>
</div>

➡️ **याला Web Table म्हणत नाहीत कारण यात** `<table>` **tag नाही.** पण ही Table सारखी दिसत असल्याने Testing Automation मध्ये XPath / CSS Selector वापरून हिला Handle करावं लागतं.

---

### **📌 मग Web Automation मध्ये काय फरक पडतो?**

**Type**

**WebTable आहे का?**

**Automation XPath / Locator**

`<table>` वापरलेली Table

✅ होय

`//table//tr//td` (Easy XPath)

`<div>`, `<ul>`, `<li>` वापरलेली Table

❌ नाही

`//div[@class='row']//div[@class='cell']` (Complex XPath)

---

### **📌 मुख्य मुद्दा:**

1.  **सर्व** `<table>` **Web Tables असतात, पण प्रत्येक Data Table Web Table नसते.**
    
2.  **Selenium साठी XPath / CSS Selectors वेगळे लागू लागतात.**
    
3.  **Web Developer ने Table कशी बनवली आहे यावर Automation ची Complexicity ठरते.**
    

➡️ **म्हणून Automation करताना पहिल्यांदा DOM structure समजून घ्यायला लागतो!** 🚀

---

### **📌 Web Tables चे Uses:**

✅ Reports किंवा Data Grids  
✅ Orders List, Transaction History  
✅ Employee Records, User Lists  
✅ Banking Statements

---

### **📌 Web Table Testing मध्ये XPath कसा वापरतात?**

Example:

-   पूर्ण **टेबल सिलेक्ट करायचं असेल:**
    
    //table
    
-   **सर्व Rows सिलेक्ट करायच्या असतील:**
    
    //table/tbody/tr
    
-   **सर्व Cells (Data Fields) सिलेक्ट करायचे असतील:**
    
    //table/tbody/tr/td
    
-   **Specific Cell (2nd row, 3rd column):**
    
    //table/tbody/tr\[2\]/td\[3\]
    

**Dynamic Web Tables मध्ये Data Search & Pagination Handling ही थोडी complex असते!**  
याबद्दल अजून काही details हवे आहेत का? 🤔

### **Types of Web Tables:**

1️⃣ **Static Web Tables**

-   Fixed number of **rows & columns**
    
-   Data **change होत नाही**
    
-   Example: एका report dashboard वर fix data असलेली table
    

2️⃣ **Dynamic Web Tables**

-   **Columns fixed असतात, पण rows बदलतात**
    
-   Data runtime ला **add/update/delete** होऊ शकतो
    
-   Example: Online Order List, जहाँ नवीन orders येत राहतात
    

3️⃣ **Tables with Pagination**

-   Table multiple pages मध्ये split असते
    
-   प्रत्येक page वर limited rows असतात
    

**3.1 Static Table with Pagination:**

-   Data बदलत नाही, पण multiple pages आहेत
    
-   Example: एक report system जिथे page-wise static records आहेत
    

**3.2 Dynamic Table with Pagination:**

-   Data बदलत राहतो आणि pagination सुद्धा आहे
    
-   Example: Gmail inbox - नवीन mails येतात, आणि pagination आहे
    

👉 **Dynamic Table + Pagination** ही testing साठी toughest असते कारण तुम्हाला pagination navigate करून **newly added data, updates, आणि deletion** handle करावे लागतात.

हे classification perfect आहे का, की अजून काही addition हवंय? 🤔

---

### **📌 Difference Between Table and WebTable**

**Feature**

**Table** (General Concept)

**WebTable** (HTML Table)

**Definition**

Data organize करण्यासाठी वापरण्यात येणारी rows आणि columns ची structure

HTML `<table>` टॅग वापरून बनवलेली data structure

**Platform**

कुठेही असू शकते (Excel, Database, Paper, PDF, etc.)

फक्त Web Page वर HTML च्या स्वरूपात असते

**Structure**

Rows आणि Columns असतात, पण format fixed नसतो

`<table>`, `<tr>`, `<td>` यासारखे fixed HTML tags असतात

**Accessibility**

Database, Documents, Sheets मध्ये सापडते

Web Browser मधे HTML DOM मधून access करता येते

**Automation Support**

UI Automation साठी वापरणे कठीण (Excel, DB वेगळे tools लागतात)

Selenium, Cypress सारख्या Tools नी XPath / CSS वापरून Automate करता येते

**Examples**

MS Excel Table, SQL Table, JSON Data Table

`<table>`, `<thead>`, `<tbody>` वापरून बनवलेली Web Table

---

### **📌 Summary:**

-   **सर्व WebTables हे Tables असतात, पण सर्व Tables हे WebTables नसतात.**
    
-   **WebTables = HTML** `<table>` **आधारित असतात.**
    
-   **Automation मध्ये XPath आणि CSS Selector वापरून WebTables handle करतात.** 🚀