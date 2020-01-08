Public Class ClsDatosLogin
    Public NomBaseDatos As String
    Public NomServidor As String
    Public NomUsuario As String
    Public Contraseña As String


    Public Sub ApplyInfo(ByRef oRpt As CrystalDecisions.CrystalReports.Engine.ReportDocument)
        Dim oCRDb As CrystalDecisions.CrystalReports.Engine.Database = oRpt.Database
        Dim oCRTables As CrystalDecisions.CrystalReports.Engine.Tables = oCRDb.Tables
        Dim oCRTable As CrystalDecisions.CrystalReports.Engine.Table
        Dim oCRTableLogonInfo As CrystalDecisions.Shared.TableLogOnInfo
        Dim oCRConnectionInfo As New CrystalDecisions.Shared.ConnectionInfo()

        oCRConnectionInfo.DatabaseName = NomBaseDatos

        oCRConnectionInfo.ServerName = NomServidor
        oCRConnectionInfo.UserID = NomUsuario
        oCRConnectionInfo.Password = Contraseña


        For Each oCRTable In oCRTables
            oCRTableLogonInfo = oCRTable.LogOnInfo
            oCRTableLogonInfo.ConnectionInfo = oCRConnectionInfo
            oCRTable.ApplyLogOnInfo(oCRTableLogonInfo)
        Next
    End Sub

End Class