


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
  //Clicks at point (38, 15) of the 'bNewEditCons' object.
  Aliases.Automedi.AMMain.bNewEditCons.Click(38, 15);
  //Clicks at point (39, 22) of the 'bNewEditCons' object.
  Aliases.Automedi.AMMain.bNewEditCons.Click(39, 22);
  //Moves the mouse cursor to the menu item specified and then simulates a single click.
  Aliases.Automedi.AMMain.pMain.RecordToolbarPanel.RecordToolbar1.PopupMenu.Click("Создать новую запись в ЭМК (Ctrl+N)");
  //Sets the 'VScroll' scrollbar control to position 88.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.VScroll.Pos = 88;
  //Selects the 'Параметры записи' tab of the 'PageControl2' tab control.
  Aliases.Automedi.fNewCons.PageControl2.ClickTab("Параметры записи");
  //Clicks at point (215, 48) of the 'lbModels' object.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.Click(215, 48);
  //Sets the 'VScroll' scrollbar control to position 0.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.VScroll.Pos = 0;
  //Clicks at point (119, 8) of the 'lbModels' object.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.Click(119, 8);
  //Enters 'терапе' in the 'lbModels' object.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.Keys("терапе");
  //Sets the 'VScroll' scrollbar control to position 187.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.VScroll.Pos = 187;
  //Clicks at point (87, 80) of the 'lbModels' object.
  Aliases.Automedi.fNewCons.PageControl2.MainTabSheet.BasePanel.TypeRecPanel.TPanel.lbModels.Click(87, 80);
  //Clicks the 'BitBtn1' button.
  Aliases.Automedi.fNewCons.Panel1.Panel2.BitBtn1.ClickButton();
  //Clicks the 'No' button.
  Aliases.Automedi.TMessageForm.No.ClickButton();
}