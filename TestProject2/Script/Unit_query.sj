function Test24() 
{  
 /* var patients_id = 535828
  
  //"select * from patdirec where patdirec_id=2742103"
  
  var query = "select * from patdirec where patdirec_id=2742103" 
  RecSet = Runner.CallMethod("Unit_var.db_connection", query);
 Log.Message("PATDIREC_ID     " + RecSet.Fields("PATDIREC_ID").Value);
  Log.Message("PATIENTS_ID     " + RecSet.Fields("PATIENTS_ID").Value);
  Log.Message("QUANTITY     " + RecSet.Fields("QUANTITY").Value); 
  Log.Message("QUANTITY_DONE     " + RecSet.Fields("QUANTITY_DONE").Value);
  Log.Message("DESCRIPTION     " + RecSet.Fields("DESCRIPTION").Value); 
  Log.Message("COMMENTAIRE     " + RecSet.Fields("COMMENTAIRE").Value);
  Log.Message("BEGIN_DATE_TIME     " + RecSet.Fields("BEGIN_DATE_TIME").Value) 
  Log.Message("END_DATE_TIME    " + RecSet.Fields("END_DATE_TIME")); 
  Log.Message("TEMPLATE_XML    " + RecSet.Fields("TEMPLATE_XML")); 
  //Log.Message(RecSet.Fields("TEMPLATE_XML")); 
  a=String(RecSet.Fields("TEMPLATE_XML"));
  //Log.Message(a.length);
  var query1="DECLARE @PATDIREC_ID INT =2742103; declare @s_xml XML,@d_xml int; set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; select k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"  
 Log.Message(query1)
  RecSet1 = Runner.CallMethod("Unit_var.db_connection", query1);  
  //Log.Message(RecSet1.Fields(k)); 
 // Log.Message(RecSet1.Fields("k")); 
 Log.Message(RecSet1.Fields.Count)
 
 for (i = 0; i<(RecSet1.Fields.Count+1); i++)
 {
    Log.Message(typeof(RecSet1.Fields.Item(i).Name));
    Log.Message("!!!")
 }  
        

  template_xml_arr=[];
  for (var i=0; i<a.length; i++)
  {
     template_xml_arr.push(a.charAt(i));
  } 
  
  str2="мг.";
  
  unit_measure_arr=[];
  for (var i=0; i<str2.length; i++)
  {
     unit_measure_arr.push(str2.charAt(i));
  } 
  
  var sum=0;
  
  for (var i=0; i<a.length; i++)
  {
    if (template_xml_arr[i]==unit_measure_arr[0])      
    {
      for (var j=0; j<str2.length; j++)
      {
        if (template_xml_arr[i]==unit_measure_arr[j])
        {
          sum++;
          i++;
        }
      }
      if (sum==str2.length)
      { 
        //Log.Message("ok!!!");
        break;
      }
    }
  }      */
    
    
 //var  PATDIREC_ID=2742618;
   var query0 = "select top 1 * from PATDIREC where PATDIREC.PATIENTS_ID=" +String(Runner.CallMethod("Unit_var.patients_id"))+ " ORDER BY PATDIREC_ID DESC" 
    //var query2 = "DECLARE @PATDIREC_ID INT = " + String(PATDIREC_ID) + " declare @s_xml XML, @d_xml int; CREATE TABLE TABLEVARIABLE  (first nvarchar(100), second nvarchar(100)); set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; INSERT INTO TABLEVARIABLE (first, second)  SELECT k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"
  
  RecSet1 = Runner.CallMethod("Unit_var.db_connection", query0);
  var PATDIREC_ID = RecSet1.Fields("PATDIREC_ID").Value ; 
 
 
 
    var query = "DECLARE @PATDIREC_ID INT = " + String(PATDIREC_ID) + " declare @s_xml XML, @d_xml int; CREATE TABLE TABLEVARIABLE  (first nvarchar(100), second nvarchar(100)); set @s_xml = (select TEMPLATE_XML from patdirec where patdirec_id=@PATDIREC_ID); exec sp_xml_preparedocument @d_xml OUTPUT, @s_xml; INSERT INTO TABLEVARIABLE (first, second)  SELECT k AS PR_VAR_NAME, v AS PR_VAR_VALUE FROM OPENXML (@d_xml, '/config/TEMPLATE_NODE/PR_VAR_NODE') with (k nvarchar(100) 'PR_VAR_NAME', v nvarchar(100) 'PR_VAR_VALUE');"
    

    Runner.CallMethod("Unit_var.db_connection", query);
    var query1 = "select * from TABLEVARIABLE"
    RecSet = Runner.CallMethod("Unit_var.db_connection", query1); 
    while (! RecSet.EOF )
    {
      Log.Message(RecSet.Fields("first").Value + "   " +RecSet.Fields("second").Value);
      RecSet.MoveNext();
    }
    //Log.Message(RecSet.Fields("first").Value + "   " +RecSet.Fields("second").Value);
    var query2 = "drop table TABLEVARIABLE"
    Runner.CallMethod("Unit_var.db_connection", query2);
    

   
 
                             
  
}