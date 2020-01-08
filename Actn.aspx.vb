Public Class Actn
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("AC") Is Nothing Then
            Response.Redirect("Login.aspx")
            Exit Sub
        End If
        If Request.QueryString("AC") = "0" Then
            If Request.QueryString("ID") Is Nothing Then
                Response.Redirect("Login.aspx")
            Else

            End If
        End If
    End Sub

End Class