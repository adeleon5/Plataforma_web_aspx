Imports System.Net
Imports Newtonsoft.Json
Imports CrystalDecisions.CrystalReports.Engine

Public Class Prueba
    Inherits System.Web.UI.Page
    Public fechahoy As String = Date.Now.ToString("yyyyMMdd")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "Json", "Cargar();", True)
            lblfecha.Text = CDate(TXTFECHAINI.Text).ToString("dd-MM-yyyy")
            Exit Sub
        End If
        DdBind(DDLEMPRESA, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  100", "ID", "EMPRESA")
        'StringJason = GetJsonData(1, fechahoy, "1") 'para el inicio de la página cargo los datos de CORPORACION RM
    End Sub

    Private Sub BTNHF_Click(sender As Object, e As EventArgs) Handles BTNHF.Click
        StringJason = GetJsonData(1, CDate(TXTFECHAINI.Text).ToString("yyyyMMdd"), DDLEMPRESA.SelectedValue.ToString)
    End Sub

    Function GetJsonData(ByRef opc As Integer, ByRef fecha As String, ByRef empresa As String) As String
        Return ConectarAPI(opc, fecha, empresa)
    End Function

    Private Function ConectarAPI(ByRef opc As Integer, ByRef fecha As String, ByRef empresa As String) As String
        Dim SP As String = ""
        If opc = 1 Then
            SP = "PRG_APP_GESTION_ARCHIVO%20111,%20" + empresa + ",%20" + fecha + ",%200,%201"
        ElseIf opc = 2 Then
            SP = "PRG_APP_GESTION_ARCHIVO%20112,%201,%20" + fechahoy
        End If

        Dim URLAPI As String = "http://190.106.203.34:9098/api/jsondata?sp=" + SP
        Dim Request As HttpWebRequest = HttpWebRequest.Create(URLAPI)
        Request.Proxy = Nothing
        Dim Response As HttpWebResponse = Request.GetResponse
        Dim ResponseStream As System.IO.Stream = Response.GetResponseStream
        Dim StreamReader As New System.IO.StreamReader(ResponseStream)
        Dim Data As String = StreamReader.ReadToEnd
        StreamReader.Close()
        Dim RJason = JsonConvert.DeserializeObject(Data)
        Return RJason
    End Function

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Function GetJasonString() As String
        Return StringJason
    End Function

    Private Sub Prueba_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If IsPostBack Then
            Exit Sub
        End If
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "Json", "Cargar();", True)
        lblfecha.Text = Date.Now.ToString("dd-MM-yyyy")
    End Sub
End Class