Imports CrystalDecisions.Shared
Imports CrystalDecisions
Imports CrystalDecisions.Web
Imports CrystalDecisions.ReportSource
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.CrystalReports.Engine.Table
Imports Microsoft
Imports System.Data.DataSet
Imports System.Data
Imports System.IO
'Imports System.Net.Http
'Imports System.Net.Http.Headers
Imports System.Net
Imports System.Text


Public Class Inicio
    Inherits System.Web.UI.Page

    Dim Fbase = New base
    Dim URLAPI As String = "http://190.106.203.34:9098/api/business"

    Private Sub Inicio_Load(sender As Object, e As EventArgs) Handles Me.Load
        If IsPostBack Then
            Exit Sub
        End If
        DdBind(DDLEMPRESAS, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  100", "ID", "EMPRESA")
        ' se declara una variable en la cual le especificaremos en donde se encuentra el reporte en este caso su ruta fisica
        Dim path As String = Server.MapPath("\reportes\rptInicio.rpt")
        Dim oReport As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        oReport.Load(path)

        'Se carga los datos que hemos proporcionado en nuestro procedimiento que creamos
        DatosLogin(oReport)

        Dim Request As HttpWebRequest = HttpWebRequest.Create(URLAPI)
        Request.Proxy = Nothing
        Dim Response As HttpWebResponse = Request.GetResponse
        Dim ResponseStream As System.IO.Stream = Response.GetResponseStream
        Dim StreamReader As New System.IO.StreamReader(ResponseStream)
        Dim Data As String = StreamReader.ReadToEnd
        StreamReader.Close()

        TXTREQUEST.Text = Data
        'Fbase.GridBind(GVINICIO, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO] 111,'1','" + DateTime.Now.ToString("yyyyMMdd") + "'", "", {""})
    End Sub

    Protected Function TablaCharts() As String
        Return TableGoogleCharts("EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  108,'1'")
    End Function

    Protected Function TablaChartsRows() As String
        Return TableGoogleChartsRows("EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO]  108,'1'")
    End Function

    Public Sub mensaje(ByRef mensaje As String)
        Dim script As String = "alert('" + mensaje + "');"
        ScriptManager.RegisterStartupScript(Me, GetType(Page), "alerta", script, True)
    End Sub

    Private Sub DDLEMPRESAS_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLEMPRESAS.SelectedIndexChanged
        'Fbase.GridBind(GVINICIO, "EXEC DB_WEB.[dbo].[PRG_APP_GESTION_ARCHIVO] 111,'" + DDLEMPRESAS.SelectedItem.Value.ToString + "','" + DateTime.Now.ToString("yyyyMMdd") + "'", "", {""})

        'declaramos dos variables las cuales serán las que contendrán todos los parámetros que declararemos
        Dim parmfields As CrystalDecisions.Shared.ParameterFields = CrystalReportViewer2.ParameterFieldInfo
        Dim parmValues As New CrystalDecisions.Shared.ParameterValues()

        'Declararemos variables para cada uno de los parámetros que necesitaremos 
        ',en este caso declararemos dos variables por cada parámetro uno será para el nombre del parámetro y otro será para el valor 
        'que este va a tener
        '@OPCION
        Dim parmfield1 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue1 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P001
        Dim parmfield2 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue2 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P002
        Dim parmfield3 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue3 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P003
        Dim parmfield4 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue4 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P004
        Dim parmfield5 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue5 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P005
        Dim parmfield6 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue6 As New CrystalDecisions.Shared.ParameterDiscreteValue()

        ' se declara una variable en la cual le especificaremos en donde se encuentra el reporte en este caso su ruta fisica
        Dim path As String = Server.MapPath("\reportes\rptInicio.rpt")
        Dim oReport As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        oReport.Load(path)

        'Se carga los datos que hemos proporcionado en nuestro procedimiento que creamos
        DatosLogin(oReport)

        'asignamos los valores y nombres de los parámetros
        'oReport.SetParameterValue("@OPCION", CInt(111), oReport.Subreports(0).Name.ToString())
        'oReport.SetParameterValue("@P001", CStr(DDLEMPRESAS.SelectedItem.Value.ToString), oReport.Subreports(0).Name.ToString())
        'oReport.SetParameterValue("@P002", CStr(DateTime.Now.ToString("yyyyMMdd")), oReport.Subreports(0).Name.ToString())
        'oReport.SetParameterValue("@P003", "", oReport.Subreports(0).Name.ToString())
        'oReport.SetParameterValue("@P004", "", oReport.Subreports(0).Name.ToString())
        'oReport.SetParameterValue("@P005", "", oReport.Subreports(0).Name.ToString())

        parmValue1.Value = CInt(111)
        parmfield1.Name = "@OPCION"
        parmfield1.CurrentValues.Add(parmValue1)

        parmValue2.Value = CStr(DDLEMPRESAS.SelectedItem.Value.ToString)
        parmfield2.Name = "@P001"
        parmfield2.CurrentValues.Add(parmValue2)

        parmValue3.Value = CStr(DateTime.Now.ToString("yyyyMMdd"))
        parmfield3.Name = "@P002"
        parmfield3.CurrentValues.Add(parmValue3)

        parmValue4.Value = ""
        parmfield4.Name = "@P003"
        parmfield4.CurrentValues.Add(parmValue4)

        parmValue5.Value = ""
        parmfield5.Name = "@P004"
        parmfield5.CurrentValues.Add(parmValue5)

        parmValue6.Value = ""
        parmfield6.Name = "@P005"
        parmfield6.CurrentValues.Add(parmValue6)

        'se cargan los valores a la variable que va a contener todos los parámetros
        parmfields.Add(parmfield1)
        parmfields.Add(parmfield2)
        parmfields.Add(parmfield3)
        parmfields.Add(parmfield4)
        parmfields.Add(parmfield5)
        parmfields.Add(parmfield6)

        'se relaciona el CrystalReportViewer con la variable oReport que declaramos en la parte superior
        CrystalReportViewer2.ReportSource = oReport

        'se carga la función ParameterFieldInfo del CrystalReportViewer con el contenedor de parametros que declaramos arriba(parmfields)
        CrystalReportViewer2.ParameterFieldInfo = parmfields
    End Sub

    Public Sub DatosLogin(ByRef oRpt As CrystalDecisions.CrystalReports.Engine.ReportDocument)
        'instaciamos la clase que hemos creado anteriormente la que se encuentra en la parte superior

        Dim AplicarLogin As New ClsDatosLogin

        'asignaremos los siguientes valores de acuerdo a la bd con la que nos estamos conectando

        AplicarLogin.NomBaseDatos = "DB_WEB"
        AplicarLogin.Contraseña = "Sa1"
        AplicarLogin.NomServidor = "10.238.57.41"
        AplicarLogin.NomUsuario = "sa"
        AplicarLogin.ApplyInfo(oRpt)

        AplicarLogin = Nothing
    End Sub

    Private Sub Inicio_Init(sender As Object, e As EventArgs) Handles Me.Init

        'declaramos dos variables las cuales serán las que contendrán todos los parámetros que declararemos
        Dim parmfields As CrystalDecisions.Shared.ParameterFields = CrystalReportViewer2.ParameterFieldInfo
        Dim parmValues As New CrystalDecisions.Shared.ParameterValues()

        'Declararemos variables para cada uno de los parámetros que necesitaremos 
        ',en este caso declararemos dos variables por cada parámetro uno será para el nombre del parámetro y otro será para el valor 
        'que este va a tener
        '@OPCION
        Dim parmfield1 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue1 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P001
        Dim parmfield2 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue2 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P002
        Dim parmfield3 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue3 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P003
        Dim parmfield4 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue4 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P004
        Dim parmfield5 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue5 As New CrystalDecisions.Shared.ParameterDiscreteValue()
        '@P005
        Dim parmfield6 As New CrystalDecisions.Shared.ParameterField()
        Dim parmValue6 As New CrystalDecisions.Shared.ParameterDiscreteValue()

        ' se declara una variable en la cual le especificaremos en donde se encuentra el reporte en este caso su ruta fisica
        Dim path As String = Server.MapPath("\reportes\rptInicio.rpt")
        Dim oReport As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        oReport.Load(path)

        'Se carga los datos que hemos proporcionado en nuestro procedimiento que creamos
        DatosLogin(oReport)

        parmValue1.Value = CInt(111)
        parmfield1.Name = "@OPCION"
        parmfield1.CurrentValues.Add(parmValue1)

        parmValue2.Value = CStr("1")
        parmfield2.Name = "@P001"
        parmfield2.CurrentValues.Add(parmValue2)

        parmValue3.Value = CStr(DateTime.Now.ToString("yyyyMMdd"))
        parmfield3.Name = "@P002"
        parmfield3.CurrentValues.Add(parmValue3)

        parmValue4.Value = ""
        parmfield4.Name = "@P003"
        parmfield4.CurrentValues.Add(parmValue4)

        parmValue5.Value = ""
        parmfield5.Name = "@P004"
        parmfield5.CurrentValues.Add(parmValue5)

        parmValue6.Value = ""
        parmfield6.Name = "@P005"
        parmfield6.CurrentValues.Add(parmValue6)

        'se cargan los valores a la variable que va a contener todos los parámetros
        parmfields.Add(parmfield1)
        parmfields.Add(parmfield2)
        parmfields.Add(parmfield3)
        parmfields.Add(parmfield4)
        parmfields.Add(parmfield5)
        parmfields.Add(parmfield6)

        'se relaciona el CrystalReportViewer con la variable oReport que declaramos en la parte superior
        CrystalReportViewer2.ReportSource = oReport

        'se carga la función ParameterFieldInfo del CrystalReportViewer con el contenedor de parametros que declaramos arriba(parmfields)
        CrystalReportViewer2.ParameterFieldInfo = parmfields
    End Sub

    Private Sub Inicio_Unload(sender As Object, e As EventArgs) Handles Me.Unload

    End Sub
End Class