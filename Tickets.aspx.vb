Imports System.Data.SqlClient

Public Class Tickets
    Inherits base

    Private Sub Tickets_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        GridBind(GVTCK, "EXEC PRG_TICKET 1,'" & Session("UCO") & "'", "", {"CODIGO"})
        DdBind(TXTDEP, "EXEC PRG_TICKET 21", "DEPARTAMENTO", "DEPARTAMENTO")
    End Sub

    Private Sub BTNADDTCK_Click(sender As Object, e As EventArgs) Handles BTNADDTCK.Click
        P0.Visible = False
        TXTDEP.SelectedIndex = -1
        TXTREQ.Text = ""
        P1.Visible = True
        TXTDEP.Focus()
    End Sub

    Private Sub BTNCAN01_Click(sender As Object, e As EventArgs) Handles BTNCAN01.Click
        P1.Visible = False
        P0.Visible = True
    End Sub

    Private Sub BTNSND01_Click(sender As Object, e As EventArgs) Handles BTNSND01.Click
        LBLERR01.Text = ""
        AbrirRecordsetData("EXEC PRG_TICKET 2,'" & Session("UCO") & "','" & TXTDEP.SelectedItem.Value & "','" & TXTREQ.Text & "','" & TXTEMPRESA.Text & "'")
        If nA(0) = 0 Then
            LBLERR01.Text = nA(1)
            Exit Sub
        End If
        Notifica("Ticket colocado exitosamente", "Tickets.aspx")
    End Sub


    Protected Sub LlenaDetalleTicket(ByRef LIT As Literal, ByVal Tck As String)
        LIT.Text = ""
        Dim nD As DataSet
        nD = ObtieneRS("EXEC PRG_TICKET 3,'" & Tck & "'")
        For nI = 0 To nD.Tables("nA").Rows.Count - 1
            LIT.Text = LIT.Text & vbNewLine & nD.Tables("nA").Rows(nI)(0).ToString
        Next
    End Sub

    Protected Sub GVTCK_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVTCK.SelectedIndexChanged
        If Val(GVTCK.SelectedRow.Cells(0).Text) = 0 Then
            Exit Sub
        End If
        P0.Visible = False
        P2.Visible = True
        LlenaDetalleTicket(LVIEW, GVTCK.SelectedRow.Cells(0).Text)
        If GVTCK.SelectedRow.Cells(4).Text = "ABIERTO" Then
            P3.Visible = True
            TXTRES.Text = ""
        End If
    End Sub

    Private Sub BTNBCKTCK_Click(sender As Object, e As EventArgs) Handles BTNBCKTCK.Click
        P2.Visible = False
        P0.Visible = True
    End Sub

    Private Sub BTNBCK02_Click(sender As Object, e As EventArgs) Handles BTNBCK02.Click
        P2.Visible = False
        P0.Visible = True
    End Sub

    Protected Sub BTNSNDRESP_Click(sender As Object, e As EventArgs) Handles BTNSNDRESP.Click
        If TXTRES.Text.Length = 0 Then
            Exit Sub
        End If
        AbrirRecordsetData("EXEC PRG_TICKET 4,'" & GVTCK.SelectedRow.Cells(0).Text & "','" & Session("UCO") & "','" & TXTRES.Text & "'")
        P2.Visible = False
        P0.Visible = True
    End Sub

    Protected Sub BTNCLOSE_Click(sender As Object, e As EventArgs) Handles BTNCLOSE.Click
        P4.Visible = False
        P5.Visible = True
        TXTCAL.SelectedIndex = -1
    End Sub

    Private Sub BTNCANCLOSE_Click(sender As Object, e As EventArgs) Handles BTNCANCLOSE.Click
        P5.Visible = False
        P4.Visible = True
    End Sub

    Private Sub BTNCLOSETCK_Click(sender As Object, e As EventArgs) Handles BTNCLOSETCK.Click
        AbrirRecordsetData("EXEC PRG_TICKET 5,'" & GVTCK.SelectedRow.Cells(0).Text & "','" & TXTCAL.SelectedItem.Value & "'")
        Notifica("Se cerró el ticket exitosamente", "Tickets.aspx")
    End Sub
End Class