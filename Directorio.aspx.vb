Public Class Directorio
    Inherits base

    Private Sub Directorio_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        TXTPROV.Items.Add("CLARO")
        TXTPROV.Items.Add("TIGO")
        TXTPROV.Items.Add("MOVISTAR")
        TXTGNR.Items.Add("MASCULINO")
        TXTGNR.Items.Add("FEMENINO")
        TXTSTT.Items.Add("0")
        TXTSTT.Items.Add("1")
        TXTDNT.Items.Add("0")
        TXTDNT.Items.Add("1")
        DdBind(TXTFLT, "EXEC PRG_DIRECTORIO 1", "CODIGO", "REPORTE")
        GridBind(GVREP, "EXEC PRG_DIRECTORIO 3,'""'", "", {"CODIGO", "CORREO"})
        TXTFLT.SelectedIndex = 0
    End Sub
    Protected Sub BTNRUN_Click(sender As Object, e As EventArgs) Handles BTNRUN.Click
        P0.Visible = False
        P1.Visible = False
        P2.Visible = True
        DdBind(TXTEMP, "EXEC PRG_DIRECTORIO 6", "CODIGO", "NOMBRE")
        DdBind(TXTDEP, "EXEC PRG_DIRECTORIO 7", "CODIGO", "NOMBRE")
    End Sub

    Protected Sub BTNRGS_Click(sender As Object, e As EventArgs) Handles BTNRGS.Click
        P0.Visible = True
        P1.Visible = False
        P2.Visible = False
    End Sub
    Protected Sub BTNBSC_Click(sender As Object, e As EventArgs) Handles BTNBSC.Click
        GridBind(GVREP, "EXEC PRG_DIRECTORIO 2,'" & TXTFLT.SelectedItem.Value & "','" & TXTREF.Text & "'", "", {"CODIGO", "CORREO"})
    End Sub

    Protected Sub GVREP_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVREP.SelectedIndexChanged
        If GVREP.SelectedRow.Cells(0).Text.Length = 0 Then
            Exit Sub
        End If
        GridBind(GVEMP, "EXEC PRG_DIRECTORIO 4,'" & GVREP.SelectedRow.Cells(0).Text & "'", "", {"CODIGO"})
        GridBind(GVTEL, "EXEC PRG_DIRECTORIO 5,'" & GVREP.SelectedRow.Cells(0).Text & "'", "", {"PERSONA"})
        P0.Visible = False
        P1.Visible = True
        P2.Visible = False
        LMOD.Text = "<h1>DATOS DEL EMPLEADO</h1><br />"
        TXTNOM.Text = GVREP.SelectedRow.Cells(1).Text
        TXTDEPTO.Text = GVREP.SelectedRow.Cells(4).Text
        TXTCRO.Text = GVREP.SelectedRow.Cells(3).Text
        GVREP.SelectedIndex = -1
    End Sub

    Protected Sub BTNBACK_Click(sender As Object, e As EventArgs) Handles BTNBACK.Click
        P0.Visible = True
        P1.Visible = False
        P2.Visible = False
    End Sub

    Protected Sub BTNGRD_Click(sender As Object, e As EventArgs) Handles BTNGRD.Click
        P0.Visible = True
        P1.Visible = False
        P2.Visible = False
        GridBind(GVREP, "EXEC PRG_DIRECTORIO 100,'" & TXTDRC.Text & "','" & TXTGNR.Text & "','" & TXTFN.Text & "','" & TXTFI.Text & "','" & TXTFS.Text & "','" & TXTSTT.Text & "','" & TXTIP.Text & "','" & TXTTS.Text & "','" & TXTDNT.Text & "','" & TXTALGS.Text & "','" & TXTNOM1.Text & "','" & TXTNOM2.Text & "','" & TXTNOM3.Text & "','" & TXTAPE1.Text & "','" & TXTAPE2.Text & "','" & TXTDCSD.Text & "','" & TXTCOR.Text & "','" & TXTTIP.Text & "','" & TXTNUM1.Text & "','" & TXTEMP.SelectedItem.Value & "','" & TXTDEP.SelectedItem.Value & "','" & TXTTLN.Text & "','" & TXTNUM.Text & "','" & TXTPROV.Text & "'", "", {""})
    End Sub
End Class