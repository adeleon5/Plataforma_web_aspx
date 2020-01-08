Imports System.Data
Imports System.Windows

Public Class Firma_Orden_Servicio
    Inherits System.Web.UI.Page

    Dim Ds As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        Dim Valor As String = Request.QueryString("Valor")
        L01LLAMADA.Visible = False
        L01LLAMADA.Text = Valor

        Dim Correlativo_SAP As String = ""
        Dim Tarea_asignada As String = ""
        Dim Cliente As String = ""
        Dim Modelo_equipo As String = ""
        Dim Serie As String = ""
        Dim Fecha_finalizacion As String = ""
        Dim Horometro As String = ""
        Dim DP As String = ""
        Dim DT As String = ""
        Dim SE As String = ""
        Dim NS As String = ""

        Ds = ObtieneRS("EXEC PRG_SAP_SERVICIOS 5,'" & L01LLAMADA.Text & "'")
        If Ds.Tables(0).Rows.Count > 0 Then
            For Each row As DataRow In Ds.Tables(0).Rows

                Correlativo_SAP = row("Correlativo_SAP")
                Tarea_asignada = row("Tarea_asignada")
                Cliente = row("Cliente")
                Modelo_equipo = row("Modelo_equipo")
                Serie = row("Serie")
                Fecha_finalizacion = row("Fecha_finalizacion")
                Horometro = row("Horometro")
                DP = row("DP")
                DT = row("DT")
                SE = row("SE")
                NS = row("NS")

            Next
            L01MENSAJE.Text = "Correlativo SAP: " + Correlativo_SAP + "</br>" + "Tarea asignada: " + Tarea_asignada + "</br>" + "Cliente: " + Cliente + "</br>" _
                + "Modelo del equipo: " + Modelo_equipo + "</br>" + "Serie: " + Serie + "</br>" + "Fecha de finalización" + Fecha_finalizacion + "</br>" _
                + "Horometro: " + Horometro + "</br>" + " Diagnostico del problema: " + DP + "</br>" + "Diagnostico técnico" + DT + "</br>" _
                + "Servicio efectura: " + SE + "</br>" + "Nota de seguridad: " + NS + "</br>"
        End If
    End Sub

    Protected Sub btnFirma_Click(sender As Object, e As EventArgs) Handles btnFirma.Click
        Dim firmaimg As String = firma.Value.ToString()
        Dim firmaimg1 As String = firma1.Value.ToString()
        Dim firmaimg2 As String = firma2.Value.ToString()

        AbrirRecordsetData("EXEC PRG_SAP_SERVICIOS 4,'" & Session.Item("UCO") & "','" & L01LLAMADA.Text & "','1','','','','','','','','" & firmaimg & "','" & firmaimg1 & "','" & firmaimg2 & "'")
    End Sub

End Class