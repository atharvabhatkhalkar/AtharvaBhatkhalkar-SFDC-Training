function validate(FormID) {
    var DOB = document.getElementById(FormID+':valPageBlock:valPageBlockSection:DOB').value;
    var Salutation = document.getElementById(FormID+':valPageBlock:valPageBlockSection:Salutation').value;
    var Country = document.getElementById(FormID+':valPageBlock:valPageBlockSection:Country').value;
    var	State = document.getElementById(FormID+':valPageBlock:valPageBlockSection:State').value;       
   	var ExpectedSalary = document.getElementById(FormID+':valPageBlock:valPageBlockSection:ExpectedSalary').value; 
    
    if(!DOB || !Salutation || !Country || !State || !ExpectedSalary){
        alert('Please Enter all fields');
    }
    
}
