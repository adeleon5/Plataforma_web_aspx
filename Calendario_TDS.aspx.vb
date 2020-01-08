Public Class Calendario_TDS
    Inherits base

    Private Sub Calendario_TDS_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        AbrirRecordsetData("EXEC PRG_RPT_SUPERTDS 5,'" & Session("UCO") & "'")
        If nA(0) = 0 Then
            Notifica(nA(1), "Menu.aspx")
            Exit Sub
        End If
        DdBind(TXTTDA, "EXEC PRG_RPT_SUPERTDS 6," & Session("UCO") & "", "INV_BOD_ID", "NOMBRE")
        DdBind(TXTNV, "EXEC PRG_RPT_SUPERTDS 7," & Session("UCO") & "", "USUARIO_ID", "NOMBRE")
        DdBind(TXTSPR, "EXEC PRG_RPT_SUPERTDS 2," & Session("UCO") & "", "CODIGO", "NOMBRE")
        GridBind(GVREP, "EXEC PRG_RPT_SUPERTDS 8", "", {"FECHAS"})
        TXTHE.Text = ""
        TXTHS.Text = ""
    End Sub

    Protected Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        Sim = "-"
        If GVREP.SelectedRow.Cells(0).Text.Length = 0 Then
            Exit Sub
        End If
        AbrirRecordsetData("PRG_RPT_SUPERTDS 104,'" & TXTTDA.SelectedItem.Value & "','" & TXTSPR.SelectedItem.Value & "','" _
                            & TXTNV.SelectedItem.Value & "','" & GVREP.SelectedRow.Cells(0).Text & "','" & TXTHE.Text & "','" & TXTHS.Text & "'")
        If GVREP.SelectedRow.Cells(2).Text = "" & TXTHE.Text & "" & Sim & "" & TXTHS.Text & "" Then
            GVREP.SelectedRow.Cells(2).Text = ""
        Else
            GVREP.SelectedRow.Cells(2).Text = "" & TXTHE.Text & "" & Sim & "" & TXTHS.Text & ""
        End If
    End Sub

    Protected Sub BTNGRD_Click(sender As Object, e As EventArgs) Handles BTNGRD.Click
        GridBind(GVREP, "EXEC PRG_RPT_SUPERTDS 8", "", {""})
        TXTHE.Text = ""
        TXTHS.Text = ""
        DdBind(TXTTDA, "EXEC PRG_RPT_SUPERTDS 6," & Session("UCO") & "", "INV_BOD_ID", "NOMBRE")
        DdBind(TXTNV, "EXEC PRG_RPT_SUPERTDS 7," & Session("UCO") & "", "USUARIO_ID", "NOMBRE")
        TXTTDA.Enabled = True
        TXTNV.Enabled = True
    End Sub

    Private Sub TXTTDA_TextChanged(sender As Object, e As EventArgs) Handles TXTTDA.TextChanged
        TXTTDA.Enabled = False
    End Sub

    Private Sub TXTNV_TextChanged(sender As Object, e As EventArgs) Handles TXTNV.TextChanged
        TXTNV.Enabled = False
    End Sub
End Class