function Test20()
{ 
  var w0=Sys.Process("Automedi"); 
  max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max; 
  height=w0.VCLObject("AMMain").VCLObject("pResume").Height;
  Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height);  
  //w1 - объект "амбулаторные назначения"
  var w1 = Runner.CallMethod("Unit_var.return_w11"); 
  w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();  

   
   // w2 - глоссарий справа
   var w2 = Runner.CallMethod("Unit_var.return_w2"); 

   arr_diagnoz_type=Runner.CallMethod("Unit_var.return_arr_diagnoz_type_icd");
   max1=[];
  
    for (i = 0; i < arr_diagnoz_type.length; i++)
    {
        str=arr_diagnoz_type[i]+"*"
        w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbICD").Click(40, 16);
        w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBarView").PopupMenu.Click(str);
        max_cur = w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VScroll.Max;
        max1.push(max_cur)     
    }
    delay(5000)

 }