Public Class Bitacora
    Inherits base

    Private Sub Bitacora_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            mensaje(ValidarModal)
            Exit Sub
        End If
        ValidarModal = "N"
        mensaje(ValidarModal)
        GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session.Item("UCO") & "'", "", {"CODIGO"})
        DdBind(DDLEMPRESABITACORA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  100", "ID", "EMPRESA")
        HF01.Value = "0"
    End Sub

    Private Sub BTNADDACT_Click(sender As Object, e As EventArgs) Handles BTNADDACT.Click
        If TXTDES.Text.Length = 0 Then
            mensaje("DEBE AGREGAR UAN DESCRIPCIÓN DE LA ACTIVIDAD")
            Exit Sub
        End If
        If HF01.Value = "0" Then
            AbrirRecordsetData("EXEC PRG_BITACORA 2,'" & Session("UCO") & "','" & TXTSOL.Text & "','" & TXTDES.Text & "'")
        Else
            GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session("UCO") & "'", "", {"CODIGO"})
            Exit Sub
        End If
        GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session("UCO") & "'", "", {"CODIGO"})
        HF01.Value = "0"
        TXTSOL.Text = ""
        TXTDES.Text = ""
        P0.Visible = True
        GVBIT.DataBind()
        GVBIT.SelectedIndex = -1
    End Sub

    Private Sub GVBIT_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVBIT.SelectedIndexChanged
        If (Val(GVBIT.SelectedRow.Cells(0).Text) = 0) Or (GVBIT.SelectedRow.Cells(5).Text.Contains("TERMINADO")) Then
            ADDSEG.Attributes.Add("style", "display:none")
            CLOSEACT.Attributes.Add("style", "display:none")
            LTESTADO.Text = "ESTADO: " + GVBIT.SelectedRow.Cells(5).Text 'lleno una literal con el estado de la actividad
            LTNOACTIVIDAD.Text = GVBIT.SelectedRow.Cells(0).Text 'lleno una liteal con el número de la actividad
            LTNOACTIVIDAD_.Text = GVBIT.SelectedRow.Cells(0).Text 'lleno una liteal con el número de la actividad
            'mando a traer las notas en html de las bitacoras para llenar la literal
            HF01.Value = GVBIT.SelectedRow.Cells(0).Text
            GetNoteActivity()
            P0.Visible = False
            P2.Visible = True
        Else
            ADDSEG.Attributes.Add("style", "display:block") 'pongo en estado visible el botón para añadir seguimientos
            LTESTADO.Text = "ESTADO: " + GVBIT.SelectedRow.Cells(5).Text 'lleno una literal con el estado de la actividad
            LTNOACTIVIDAD.Text = GVBIT.SelectedRow.Cells(0).Text 'lleno una liteal con el número de la actividad
            LTNOACTIVIDAD_.Text = GVBIT.SelectedRow.Cells(0).Text 'lleno una liteal con el número de la actividad
            HF01.Value = GVBIT.SelectedRow.Cells(0).Text
            '------------------------------------------------------------------------------------------------------------
            'mando a traer las notas en html de las bitacoras para llenar la literal
            GetNoteActivity()

            If GVBIT.SelectedRow.Cells(5).Text.Contains("PENDIENTE") Then
                CLOSEACT.Attributes.Add("style", "display:block")
            Else
                CLOSEACT.Attributes.Add("style", "display:none")
            End If
            P0.Visible = False
            P2.Visible = True
        End If
    End Sub

    Public Sub GetNoteActivity()
        Dim DSLocal As DataSet
        L02.Text = ""
        DSLocal = ObtieneRS("EXEC PRG_BITACORA 3,'" & HF01.Value & "'")
        For Each fila As DataRow In DSLocal.Tables(0).Rows()
            L02.Text = L02.Text & fila(0)
        Next
    End Sub

    Private Sub BTNFLT_Click(sender As Object, e As EventArgs) Handles BTNFLT.Click
        GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session("UCO") & "','" & TXTDEL.Text & "','" & TXTAL.Text & "'", "", {"CODIGO"})
    End Sub

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Public Sub EjecutarJS(ByRef script As String)
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Private Sub BTNPROCESARSEGUIMIENTO_Click(sender As Object, e As EventArgs) Handles BTNPROCESARSEGUIMIENTO.Click
        If HF01.Value = "0" Then
            GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session("UCO") & "'", "", {"CODIGO"})
            Exit Sub
        Else
            AbrirRecordsetData("EXEC PRG_BITACORA 5,'" & Session("UCO") & "','" & TXTSOL1.Text & "','" & TXTDESC1.Text & "','" & HF01.Value & "'")
        End If
        GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session("UCO") & "'", "", {"CODIGO"})
        HF01.Value = "0"
        P2.Visible = False
        P0.Visible = True
        GVBIT.SelectedIndex = -1
    End Sub

    Private Sub BTNCANCELARSEGUIMIENTO_Click(sender As Object, e As EventArgs) Handles BTNCANCELARSEGUIMIENTO.Click
        P2.Visible = False
        P0.Visible = True
        GVBIT.SelectedIndex = -1
    End Sub

    Private Sub BTNCERRARACTIVIDAD_Click(sender As Object, e As EventArgs) Handles BTNCERRARACTIVIDAD.Click
        AbrirRecordsetData("EXEC PRG_BITACORA 4,'" & Session("UCO") & "','SISTEMA CIERRE','" & TXTCOMENTCIERRE.Text & "','" & HF01.Value & "'")
        GridBind(GVBIT, "EXEC PRG_BITACORA 1,'" & Session.Item("UCO") & "'", "", {"CODIGO"})
        TXTCOMENTCIERRE.Text = ""
        P2.Visible = False
        P0.Visible = True
    End Sub

    Private Sub DDLEMPRESABITACORA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLEMPRESABITACORA.SelectedIndexChanged
        ValidarModal = "S"
        mensaje("paso por aquí")
    End Sub
End Class