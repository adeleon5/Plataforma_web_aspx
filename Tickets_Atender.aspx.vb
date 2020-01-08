Public Class Tickets_Atender
    Inherits base


    Private Sub Tickets_Atender_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        GridBind(GVTCK, "EXEC PRG_TICKET 22,'" & Session("UCO") & "'", "", {"CODIGO", "DEPTO"})
        If GVTCK.Rows(0).Cells(1).Text <> "" Then
            LBLDEP.Text = GVTCK.Rows(0).Cells(1).Text
        End If
    End Sub

    Private Sub GVTCK_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVTCK.SelectedIndexChanged
        If GVTCK.SelectedRow.Cells(0).Text <> "0" Then
            LlenaDetalleTicket(LVIEW, GVTCK.SelectedRow.Cells(0).Text)
            P0.Visible = False
            P1.Visible = True
            TXTRES.Text = ""
            TXTRES.Focus()
        End If
    End Sub

    Protected Sub LlenaDetalleTicket(ByRef LIT As Literal, ByVal Tck As String)
        LIT.Text = ""
        Dim nD As DataSet
        nD = ObtieneRS("EXEC PRG_TICKET 3,'" & Tck & "'")
        For nI = 0 To nD.Tables("nA").Rows.Count - 1
            LIT.Text = LIT.Text & vbNewLine & nD.Tables("nA").Rows(nI)(0).ToString
        Next
    End Sub

    Protected Sub BTNCANCEL_Click(sender As Object, e As EventArgs) Handles BTNCANCEL.Click
        P1.Visible = False
        P0.Visible = True
        TXTRES.Text = ""
    End Sub

    Protected Sub BTNSNDRESP_Click(sender As Object, e As EventArgs) Handles BTNSNDRESP.Click
        If TXTRES.Text.Length = 0 Then
            Exit Sub
        End If
        AbrirRecordsetData("EXEC PRG_TICKET 4,'" & GVTCK.SelectedRow.Cells(0).Text & "','" & Session("UCO") & "','" & TXTRES.Text & "'")
        P1.Visible = False
        P0.Visible = True
    End Sub
End Class