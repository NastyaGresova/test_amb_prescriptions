


function Test8()
{
  //Drags from point (1225, 37) of the 'TFormContainer_88EB33828AC74FC1BB5A13E075E073AB' object to offset (1, 726).
  Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TFormContainer_88EB33828AC74FC1BB5A13E075E073AB.Drag(1225, 37, 1, 726);
  //Sets the 'HScroll' scrollbar control to position 0.
  Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.HScroll.Pos = 0;
  //Sets the 'VScroll' scrollbar control to position 3096.
  Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VScroll.Pos = 3096;
  //Sets the 'HScroll' scrollbar control to position 0.
  Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.HScroll.Pos = 0;
  //Sets the 'VScroll' scrollbar control to position 920.
  Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.VScroll.Pos = 920;
}

function Test9()
{
  //Compares the edMed Stores item with the properties of the Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed object.
  Objects.edMed.Check(Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed);
  //Selects the 'Схема приема' tab of the 'pcPrescr' tab control.
  Aliases.Automedi.DirServEditor.pRecord.pcPrescr.ClickTab("Схема приема");
  //Enters '[Enter]' in the 'cbTemplate' object.
  Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnPrTemplate.pnTemplateToolBar.pnCbTemplate.cbTemplate.Keys("[Enter]");
  //Checks whether the 'wText' property of the Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed object equals 'L-ТИРОКСИН 100 БЕРЛИН-ХЕМИ таб. 100 мкг'.
  aqObject.CheckProperty(Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed, "wText", 0, "L-ТИРОКСИН 100 БЕРЛИН-ХЕМИ таб. 100 мкг");
}

function Test7()
{
  //Checks whether the 'wText' property of the Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed object does not equal 'L-ТИРОКСИН 100 БЕРЛИН-ХЕМИ таб. 100 мкг'.
  aqObject.CheckProperty(Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed, "wText", 1, "L-ТИРОКСИН 100 БЕРЛИН-ХЕМИ таб. 100 мкг");
}

function Test6()
{
  //Checks whether the 'wText' property of the Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed object is greater than 'L-ТИРОКСИН 100 БЕРЛИН-ХЕМИ таб. 100 мкг'.
  aqObject.CheckProperty(Aliases.Automedi.DirServEditor.pRecord.pcPrescr.tsIntakeScheme.pnTemplate.fmPRPlanBuilder_1.pnHeader.pnPrMain.edMed, "wText", 2, "L-ТИРОКСИН 100 БЕРЛИН-ХЕМИ таб. 100 мкг");
}