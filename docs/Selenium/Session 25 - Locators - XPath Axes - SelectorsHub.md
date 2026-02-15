-   Self
    
-   Parent
    
-   Child
    
-   Ancestor - parent's parent
    
-   Descendant - child's child
    
-   Sibling nodes -- preceding sibling, following sibling
    

**Most preferred method to find parent:**

1.  //input\[@id="username"\]/parent::form
    
2.  //input\[@id="username"\]/parent::\*
    

**Avoid using input\[@id="username"\]/.. because:**  
✅ It breaks easily with structural changes.  
✅ It reduces readability and explicitness.  
✅ It can cause unexpected errors.

from self-node, you can have multiple descendants but there will be only one ancestor.

---

## Looking descendants of a known element

//form\[@id="frm\_login"\]/descendant::input  
//form\[@id="frm\_login"\]//input  
This will select all <input> elements including current one (self-node)

If self-node has multiple descendants with same tag-name i.e. (eg. multiple input tags) then

//form\[@id="frm\_login"\]//input\[1\]  
//form\[@id="frm\_login"\]//input\[2\]

// input\[@id='username'\]/following::input  
\--> will select all <input> elements except current one (self-node)

## Practice Problem

Take the following codes and tell me if there are more than 1 input elements / tags then which input element it will locate ?

//form\[@id="frm\_login"\]//input

// input\[@id='username'\]/following::input