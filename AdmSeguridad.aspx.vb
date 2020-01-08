Public Class AdmSeguridad
    Inherits base

    Private Sub AdmSeguridad_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        HF01.Value = ""
        GridBind(GVUSR, "EXEC SEGURIDAD 2001", "", {"CODIGO"})
    End Sub

    Private Sub BTNBCKP1_Click(sender As Object, e As EventArgs) Handles BTNBCKP1.Click
        P1.Visible = False
        GridBind(GVUSR, "EXEC SEGURIDAD 2001", "", {"CODIGO"})
        P0.Visible = True
    End Sub

    Private Sub BTNADDUSR_Click(sender As Object, e As EventArgs) Handles BTNADDUSR.Click
        TXTNOM.Text = ""
        TXTEMA.Text = ""
        P0.Visible = False
        PP02.Visible = True
        'PPUP02.Show()
        'GVUSR.SelectedIndex = -1
        'P0.Visible = False
        'P1.Visible = True
    End Sub

    Private Sub GVUSR_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVUSR.SelectedIndexChanged
        If Val(GVUSR.SelectedRow.Cells(0).Text) > 0 Then
            HF01.Value = GVUSR.SelectedRow.Cells(0).Text
            GridBind(GVEDUS, "EXEC SEGURIDAD 2002,'" & HF01.Value & "','1'", "", {""})
            GridBind(GVPRE, "EXEC SEGURIDAD 2002,'" & HF01.Value & "','2'", "", {"Codigo", "TIPO", "VALORES"})
            GridBind(GVPERUS, "EXEC SEGURIDAD 2002,'" & HF01.Value & "','3'", "", {"CODIGO"})
            P0.Visible = False
            P1.Visible = True
        End If
    End Sub

    Private Sub GVEDUS_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVEDUS.SelectedIndexChanged
        If GVEDUS.SelectedRow.Cells(0).Text.Contains("CODIGO") Then
            Exit Sub
        End If
        If GVEDUS.SelectedRow.Cells(0).Text.Contains("ESTADO") Then
            AbrirRecordsetData("EXEC SEGURIDAD 2002,'" & HF01.Value & "','4','" & GVEDUS.SelectedRow.Cells(1).Text & "'")
            GVEDUS.SelectedRow.Cells(1).Text = nA(0)
            Exit Sub
        End If
        LBLVALOR.Text = HttpUtility.HtmlDecode(GVEDUS.SelectedRow.Cells(0).Text)
        TXTVAL.Text = HttpUtility.HtmlDecode(GVEDUS.SelectedRow.Cells(1).Text)
        HFPUP.Value = "GRAL"
        P1.Visible = False
        PP01.Visible = True
        'PPUP01.Show()
    End Sub

    Private Sub BTNOKPOPUP_Click(sender As Object, e As EventArgs) Handles BTNOKPOPUP.Click
        If HFPUP.Value = "GRAL" Then
            If TXTVAL.Text <> HttpUtility.HtmlDecode(GVEDUS.SelectedRow.Cells(1).Text) Then
                AbrirRecordsetData("EXEC SEGURIDAD 2002,'" & HF01.Value & "','5','" & GVEDUS.SelectedRow.Cells(0).Text & "','" & TXTVAL.Text & "'")
                GVEDUS.SelectedRow.Cells(1).Text = TXTVAL.Text
            End If
        ElseIf HFPUP.Value = "PRE" Then
            If TXTVAL.Visible = True Then
                If TXTVAL.Text <> HttpUtility.HtmlDecode(GVPRE.SelectedRow.Cells(2).Text) Then
                    AbrirRecordsetData("EXEC SEGURIDAD 2002,'" & HF01.Value & "','6','" & GVPRE.SelectedRow.Cells(0).Text & "','" & TXTVAL.Text & "'")
                    GVPRE.SelectedRow.Cells(3).Text = TXTVAL.Text
                    GridBind(GVPRE, "EXEC SEGURIDAD 2002,'" & HF01.Value & "','2'", "", {"Codigo", "TIPO", "VALORES"})
                End If
            Else
                If TXTSEL.SelectedItem.Text <> HttpUtility.HtmlDecode(GVPRE.SelectedRow.Cells(2).Text) Then
                    AbrirRecordsetData("EXEC SEGURIDAD 2002,'" & HF01.Value & "','6','" & GVPRE.SelectedRow.Cells(0).Text & "','" & TXTSEL.SelectedItem.Text & "'")
                    GVPRE.SelectedRow.Cells(3).Text = TXTVAL.Text
                    GridBind(GVPRE, "EXEC SEGURIDAD 2002,'" & HF01.Value & "','2'", "", {"Codigo", "TIPO", "VALORES"})
                End If                
            End If
        End If
        PP01.Visible = False
        P1.Visible = True
        'PPUP01.Hide()
    End Sub

    Private Sub GVPRE_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVPRE.SelectedIndexChanged
        LBLVALOR.Text = HttpUtility.HtmlDecode(GVPRE.SelectedRow.Cells(2).Text)
        TXTVAL.Text = HttpUtility.HtmlDecode(GVPRE.SelectedRow.Cells(3).Text)
        If GVPRE.SelectedRow.Cells(4).Text.Contains(",") Then
            TXTSEL.Items.Clear()
            Dim nS As String()
            nS = GVPRE.SelectedRow.Cells(4).Text.Split(",")
            For nI = 0 To nS.GetUpperBound(0)
                TXTSEL.Items.Add(nS(nI))
            Next
            TXTVAL.Visible = False
            TXTSEL.Visible = True
        End If
        HFPUP.Value = "PRE"
        If GVPRE.SelectedRow.Cells(1).Text.Contains("F") Then
            ''TXTVAL.TextMode = TextBoxMode.Date
        ElseIf GVPRE.SelectedRow.Cells(1).Text.Contains("E") Then
            ''TXTVAL.TextMode = TextBoxMode.Number
        End If
        LBLERRMNW.Text = ""
        P1.Visible = False
        PP01.Visible = True
    End Sub

    Private Sub GVPERUS_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVPERUS.SelectedIndexChanged
        AbrirRecordsetData("EXEC SEGURIDAD 2002,'" & HF01.Value & "','7','" & GVPERUS.SelectedRow.Cells(0).Text & "'")
        If GVPERUS.SelectedRow.Cells(3).Text = "1" Then
            GVPERUS.SelectedRow.Cells(3).Text = ""
        Else
            GVPERUS.SelectedRow.Cells(3).Text = "1"
        End If
    End Sub

    Private Sub BTNSAVNEW_Click(sender As Object, e As EventArgs) Handles BTNSAVNEW.Click
        LBLERRMNW.Text = ""
        If TXTNOM.Text.Length = 0 Or TXTEMA.Text.Length = 0 Then
            LBLERRMNW.Text = "DEBE INGRESAR UN NOMBRE Y CORREO ELECTRONICO"
            Exit Sub
        End If
        If TXTCODEMPSAP.Text.Length = 0 Then
            TXTCODEMPSAP.Text = "0"
        End If

        AbrirRecordsetData("EXEC SEGURIDAD 1,'ADMINISTRADOR','" & TXTNOM.Text & "','','" & TXTEMA.Text & "','" & TXTCODEMPSAP.Text & "'")
        If nA(0) = 0 Then
            LBLERRMNW.Text = nA(1)
            Exit Sub
        End If
        GridBind(GVUSR, "EXEC SEGURIDAD 2001", "", {"CODIGO"})
        PP02.Visible = False
        P0.Visible = True
    End Sub

    Private Sub BTNCANNEW_Click(sender As Object, e As EventArgs) Handles BTNCANNEW.Click
        PP02.Visible = False
        P0.Visible = True
    End Sub

    Protected Sub BTNCANCELPOPUP_Click(sender As Object, e As EventArgs) Handles BTNCANCELPOPUP.Click
        PP01.Visible = False
        P1.Visible = True
    End Sub

    Private Sub BTNMNUADD_Click(sender As Object, e As EventArgs) Handles BTNMNUADD.Click
        PP03.Visible = False
        PP04.Visible = True
    End Sub

    Private Sub BTNMNUCAN_Click(sender As Object, e As EventArgs) Handles BTNMNUCAN.Click
        PP03.Visible = False
        P0.Visible = True
    End Sub

    Private Sub GVMENU_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVMENU.SelectedIndexChanged
        If GVMENU.SelectedRow.Cells(0).Text <> "0" Then
            If GVMENU.SelectedRow.Cells(2).Text <> "(Ver Detalle)" Then
                Exit Sub
            End If
            LBLNODO.Text = GVMENU.SelectedRow.Cells(1).Text
            HFPADRE.Value = GVMENU.SelectedRow.Cells(0).Text
            GridBind(GVMENU, "EXEC SEGURIDAD 3001,'" & GVMENU.SelectedRow.Cells(0).Text & "'", "", {"Codigo"})
        End If
    End Sub

    Private Sub BTNMNUANT_Click(sender As Object, e As EventArgs) Handles BTNMNUANT.Click
        AbrirRecordsetData("EXEC SEGURIDAD 3002,'" & HFPADRE.Value & "'")
        HFPADRE.Value = nA(0)
        LBLNODO.Text = nA(1)
        If HFPADRE.Value <> "0" Then
            GridBind(GVMENU, "EXEC SEGURIDAD 3001,'" & HFPADRE.Value & "'", "", {"Codigo"})
        End If
    End Sub

    Protected Sub BTNADDMNU_Click(sender As Object, e As EventArgs) Handles BTNADDMNU.Click
        P0.Visible = False
        PP03.Visible = True
        HFPADRE.Value = "0"
        LBLNODO.Text = "Grupo Pinulito"
        GridBind(GVMENU, "EXEC SEGURIDAD 3001,'0'", "", {"Codigo"})
    End Sub

    Private Sub BTNBCKPER_Click(sender As Object, e As EventArgs) Handles BTNBCKPER.Click
        P2.Visible = False
        P0.Visible = True
    End Sub

    Private Sub BTNEDIPER_Click(sender As Object, e As EventArgs) Handles BTNEDIPER.Click
        P0.Visible = False
        P2.Visible = True
        GridBind(GVPER, "EXEC SEGURIDAD 2004", "", {"CODIGO"})
    End Sub

    Private Sub BTNREP22_Click(sender As Object, e As EventArgs) Handles BTNREP22.Click
        'GUARDAR NUEVO PERFIL
        LBLERR22.Text = ""
        AbrirRecordsetData("EXEC SEGURIDAD 2003,'" & TXTNOMPER.Text & "','" & TXTDESPER.Text & "'")
        If nA(0) = 0 Then
            LBLERR22.Text = nA(1)
            Exit Sub
        End If
        P2_2.Visible = False
        P2_1.Visible = True
        GridBind(GVPER, "EXEC SEGURIDAD 2004", "", {"CODIGO"})
    End Sub

    Private Sub BTNADDPER_Click(sender As Object, e As EventArgs) Handles BTNADDPER.Click
        P2_1.Visible = False
        P2_2.Visible = True
        TXTNOMPER.Text = ""
        TXTDESPER.Text = ""
    End Sub

    Protected Sub BTNREP23_Click(sender As Object, e As EventArgs) Handles BTNREP23.Click
        P2_2.Visible = False
        P2_1.Visible = True
    End Sub

    Protected Sub BTNBCKP23_Click(sender As Object, e As EventArgs) Handles BTNBCKP23.Click
        P2_3.Visible = False
        P2_1.Visible = True
    End Sub

    Protected Sub GVPER_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVPER.SelectedIndexChanged
        If Val(GVPER.SelectedRow.Cells(0).Text) <= 0 Then
            Exit Sub
        End If
        LP2_3.Text = "<h2>Modificar accesos del perfil " & GVPER.SelectedRow.Cells(1).Text & "</h2>"
        GridBind(GVACC, "EXEC SEGURIDAD 2005,'" & GVPER.SelectedRow.Cells(0).Text & "'", "", {"CODIGO"})
        P2_1.Visible = False
        P2_3.Visible = True
    End Sub

    Protected Sub GVACC_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVACC.SelectedIndexChanged
        If Val(GVACC.SelectedRow.Cells(0).Text) <= 0 Then
            Exit Sub
        End If
        GridBind(GVACC, "EXEC SEGURIDAD 2005,'" & GVPER.SelectedRow.Cells(0).Text & "','" & GVACC.SelectedRow.Cells(0).Text & "'", "", {"CODIGO"})
    End Sub

    Protected Sub BTNDELP23_Click(sender As Object, e As EventArgs) Handles BTNDELP23.Click
        LBLERR23.Text = ""
        AbrirRecordsetData("EXEC SEGURIDAD 2005,'" & GVPER.SelectedRow.Cells(0).Text & "','*'")
        If nA(0) = 0 Then
            LBLERR23.Text = nA(1)
            Exit Sub
        End If
        P2_3.Visible = False
        P2_1.Visible = True
        GridBind(GVPER, "EXEC SEGURIDAD 2004", "", {"CODIGO"})
    End Sub

    Protected Sub BTNCANMENU_Click(sender As Object, e As EventArgs) Handles BTNCANMENU.Click
        PP04.Visible = False
        PP03.Visible = True
    End Sub

    Private Sub BTNADDPE_Click(sender As Object, e As EventArgs) Handles BTNADDPE.Click
        If TXTPENOM.Text.Length > 0 Then
            AbrirRecordsetData("EXEC SEGURIDAD 2002,'','8','" & TXTPENOM.Text & "','" & TXTPETIP.SelectedValue & "','" & TXTPEVAL.Text & "'")
            GridBind(GVPRE, "EXEC SEGURIDAD 2002,'" & HF01.Value & "','2'", "", {"Codigo", "TIPO", "VALORES"})
            TXTPENOM.Text = ""
            TXTPEVAL.Text = ""
        End If
    End Sub

    Private Sub BTNRESTA_Click(sender As Object, e As EventArgs) Handles BTNRESTA.Click
        'REESTABLECER CONTRASEÑA DE USUARIO HF01
        If HF01.Value <> "" Then
            AbrirRecordsetData("EXEC SEGURIDAD 15,'" & HF01.Value & "'")
            BTNBCKP1_Click(sender, e)
        End If
    End Sub

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Private Sub BTNADDMENU_Click(sender As Object, e As EventArgs) Handles BTNADDMENU.Click
        AbrirRecordsetData("EXEC SEGURIDAD 2006,'" & HFPADRE.Value & "','" & TXTPANTN.Text & "','" & TXTPANTD.Text & "'")
        If nA(0) = 0 Then
            mensaje(nA(1).ToString)
            Exit Sub
        End If
        PP04.Visible = False
        PP03.Visible = True
        GridBind(GVMENU, "EXEC SEGURIDAD 3001,'" & HFPADRE.Value & "'", "", {"Codigo"})
    End Sub
End Class