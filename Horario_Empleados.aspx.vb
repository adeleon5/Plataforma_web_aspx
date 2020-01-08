Public Class Horario_Empleados
    Inherits base

    Private Sub Horario_Empleados_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        AbrirRecordsetData("EXEC PRG_RPT_RRHH 5,'" & Session("UCO") & "'")
        If nA(0) = 0 Then
            Notifica(nA(1), "Menu.aspx")
            Exit Sub
        End If
        DdBind(TXTDEP, "EXEC PRG_RPT_RRHH 2", "DEPARTAMENTO", "DESCRIPCION")
        TXTSCN.Text = ""
        TXTEPD.Text = ""
        TXTHEM.Text = ""
        TXTHSM.Text = ""
        TXTHPD.Text = ""
    End Sub

    Protected Sub TXTDEP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTDEP.SelectedIndexChanged
        DdBind(TXTSCN, "EXEC PRG_RPT_RRHH 6,'" & TXTDEP.SelectedItem.Value & "'", "CODIGO", "DEPARTAMENTO")
    End Sub

    Protected Sub TXTSCN_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TXTSCN.SelectedIndexChanged
        DdBind(TXTEPD, "EXEC PRG_RPT_RRHH 7,'" & TXTSCN.SelectedItem.Value & "','" & TXTDEP.SelectedItem.Value & "'", "CODIGO", "NOMBRE")
    End Sub

    Protected Sub CHKLUN_CheckedChanged(sender As Object, e As EventArgs) Handles CHKLUN.CheckedChanged
        If CHKLUN.Checked = True Then
            LBLERR1.Text = ""
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKLUN.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Protected Sub CHKMAR_CheckedChanged(sender As Object, e As EventArgs) Handles CHKMAR.CheckedChanged
        If CHKMAR.Checked = True Then
            LBLERR1.Text = ""
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKMAR.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Private Sub CHKMIR_CheckedChanged(sender As Object, e As EventArgs) Handles CHKMIR.CheckedChanged
        LBLERR1.Text = ""
        If CHKMIR.Checked = True Then
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKMIR.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Private Sub CHKJUE_CheckedChanged(sender As Object, e As EventArgs) Handles CHKJUE.CheckedChanged
        LBLERR1.Text = ""
        If CHKJUE.Checked = True Then
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKJUE.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Private Sub CHKVIE_CheckedChanged(sender As Object, e As EventArgs) Handles CHKVIE.CheckedChanged
        LBLERR1.Text = ""
        If CHKVIE.Checked = True Then
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKVIE.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Private Sub CHKSAB_CheckedChanged(sender As Object, e As EventArgs) Handles CHKSAB.CheckedChanged
        LBLERR1.Text = ""
        If CHKSAB.Checked = True Then
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKSAB.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Private Sub CHKDOM_CheckedChanged(sender As Object, e As EventArgs) Handles CHKDOM.CheckedChanged
        LBLERR1.Text = ""
        If CHKDOM.Checked = True Then
            AbrirRecordsetData("PRG_RPT_RRHH 106,'" & TXTSCN.SelectedItem.ToString & "','" & TXTEPD.Text & "','" & TXTHEM.Text & "','" & TXTHSM.Text & "','" & Session("UCO") & "','" & TXTDEP.Text & "','" & CHKDOM.Text & "','" & TXTHPD.Text & "'")
            If nA(0) = 0 Then
                LBLERR1.Text = nA(1)
                Exit Sub
            End If
        Else
            Exit Sub
        End If
    End Sub

    Protected Sub BTNACT_Click(sender As Object, e As EventArgs) Handles BTNACT.Click
        TXTHEM.Text = ""
        TXTHSM.Text = ""
        TXTHPD.Text = ""
        LBLERR1.Text = ""
        CHKLUN.Checked = False
        CHKMAR.Checked = False
        CHKMIR.Checked = False
        CHKJUE.Checked = False
        CHKVIE.Checked = False
        CHKSAB.Checked = False
        CHKDOM.Checked = False
    End Sub

End Class

