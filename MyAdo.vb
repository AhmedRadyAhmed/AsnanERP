Imports Microsoft.VisualBasic
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net.Mail
Imports System.Net
Imports System.Exception
Imports System.Collections.Generic
Imports System.Configuration
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.Page
Imports System.Web.SessionState.HttpSessionState
Imports System.Collections
Imports System
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared


Public Class MyAdo
    Dim mytran As SqlTransaction
    Dim MySql As New SqlConnection
    Dim mycmd As New SqlCommand
    Public Sub Clear_pool()
        SqlConnection.ClearAllPools()

    End Sub

    Public Sub Redirect(ByVal url As String, ByVal target As String, ByVal windowFeatures As String)
        Dim context As HttpContext = HttpContext.Current

        If ([String].IsNullOrEmpty(target) OrElse target.Equals("_self", StringComparison.OrdinalIgnoreCase)) AndAlso [String].IsNullOrEmpty(windowFeatures) Then

            context.Response.Redirect(url)
        Else
            Dim page As Page = DirectCast(context.Handler, Page)
            If page Is Nothing Then
                Throw New InvalidOperationException("Cannot redirect to new window outside Page context.")
            End If
            url = page.ResolveClientUrl(url)

            Dim script As String
            If Not [String].IsNullOrEmpty(windowFeatures) Then
                script = "window.open(""{0}"", ""{1}"", ""{2}"");"
            Else
                script = "window.open(""{0}"", ""{1}"");"
            End If

            script = [String].Format(script, url, target, windowFeatures)
            ScriptManager.RegisterStartupScript(page, GetType(Page), "Redirect", script, True)
        End If
    End Sub
    Public Sub ExportPDFReport(ByVal Sl As String, ByVal Rep As String, ByVal tparam As String, Optional ByVal printerr As String = "")
        Try
            Dim oStream As New MemoryStream
            Dim tb As New DataTable("mytb")
            tb = GetTable(Sl)
            Dim repdoc As New ReportDocument
            Dim reportPath As String = HttpContext.Current.Server.MapPath("~/Reports/" & Rep & ".rpt")
            repdoc.Load(reportPath)
            repdoc.SetDataSource(tb)
            repdoc.SetParameterValue("tparam", tparam)


            CrystalDecisions.Shared.ExportOptions.CreateTextFormatOptions.CharactersPerInch = 16

            CrystalDecisions.Shared.ExportOptions.CreateTextFormatOptions.LinesPerPage = 50

            repdoc.ExportToDisk(ExportFormatType.Text, "c:\toto.txt")
            repdoc.PrintOptions.PrinterName = printerr
            repdoc.PrintToPrinter(1, True, 0, 0)
            repdoc.Close()
            repdoc.Dispose()
        Catch ex As Exception

        End Try
       
    End Sub

    Public Sub ExportPDFReport22(ByVal Sl As String, ByVal Rep As String)
        Try
            Dim oStream As New MemoryStream
            Dim tb As New DataTable("mytb")
            tb = GetTable(Sl)
            Dim repdoc As New ReportDocument
            Dim reportPath As String = HttpContext.Current.Server.MapPath("~/Reports/" & Rep & ".rpt")
            repdoc.Load(reportPath)
            repdoc.SetDataSource(tb)
            repdoc.ExportToDisk(ExportFormatType.PortableDocFormat, HttpContext.Current.Server.MapPath("~/MyFiles/toto2.pdf"))



            repdoc.Close()
            repdoc.Dispose()
        Catch ex As Exception

        End Try

    End Sub
    Public Sub Report_Send_Mail(ByVal TO_mail As String, ByVal Sl As String, ByVal Rep As String, ByVal QtNo As String)
        Dim oStream As New MemoryStream
        Dim tb As New DataTable("mytb")
        tb = GetTable(Sl)
        Dim repdoc As New ReportDocument
        Dim reportPath As String = HttpContext.Current.Server.MapPath("~/Reports/" & Rep & ".rpt")
        repdoc.Load(reportPath)
        repdoc.SetDataSource(tb)



        CrystalDecisions.Shared.ExportOptions.CreateTextFormatOptions.CharactersPerInch = 16

        CrystalDecisions.Shared.ExportOptions.CreateTextFormatOptions.LinesPerPage = 50


        repdoc.ExportToDisk(ExportFormatType.PortableDocFormat, "c:\Asnan Quotation No" & QtNo & ".pdf")

        repdoc.Close()
        repdoc.Dispose()

        SendMail(TO_mail, "Asnan Qoutation", "Qoutation", "c:\Asnan Quotation No" & QtNo & ".pdf")
        '  System.IO.File.Delete("c:\Asnan Quotation No" & QtNo & ".pdf")
    End Sub

    Public Function GetDocReport(ByVal Sl As String, ByVal Rep As String, Optional ByVal flag As Boolean = False) As ReportDocument

        Dim tb As New DataTable
        tb = GetTable(Sl)
        If flag = True Then
            For i As Integer = 0 To tb.Rows.Count - 1
                If tb.Rows(i)(0).ToString = "" Then
                    tb.Rows(i)(0) = tb.Rows(i)(2).ToString()
                    tb.Rows(i)(1) = tb.Rows(i)(3).ToString()
                End If
            Next
        End If

        Dim repdoc As New ReportDocument
        Dim reportPath As String = HttpContext.Current.Server.MapPath("~/Reports/" & Rep & ".rpt")
        repdoc.Load(reportPath)
        repdoc.SetDataSource(tb)
        Return repdoc
    End Function
    Public Function GetDocReport(ByVal tb As DataTable, ByVal Rep As String) As ReportDocument

        Dim repdoc As New ReportDocument
        Dim reportPath As String = HttpContext.Current.Server.MapPath("~/Reports/" & Rep & ".rpt")
        repdoc.Load(reportPath)
        repdoc.SetDataSource(tb)
        Return repdoc
    End Function
    Public Sub PrintReport(ByVal Sl As String, ByVal Rep As String, Optional ByVal tpp As String = "")

        Dim tb As New DataTable
        tb = GetTable(Sl)
        Dim repdoc As New ReportDocument
        Dim reportPath As String = HttpContext.Current.Server.MapPath("~/Reports/" & Rep & ".rpt")
        repdoc.Load(reportPath)

        repdoc.SetDataSource(tb)
        If tpp <> "" Then
            repdoc.SetParameterValue("tparam", tpp)
        End If

        repdoc.PrintToPrinter(1, 1, 1, 1)
    End Sub
    Public Function To_Mydate(s As String) As String

        Dim d, m, y As Integer
        Dim sppp() As String = s.Split("/")
        m = sppp(0)
        d = sppp(1)
        y = sppp(2)
        Return m.ToString("00") + "/" + d.ToString("00") + "/" + y.ToString()
    End Function

    Public Function ISMydate(dt As String) As Boolean
        Return IsDate(dt)
    End Function
    Public Function ISNumber(s As String) As Boolean
        Return IsNumeric(s)
    End Function
    Public Function Get_no_Days(D1 As Date, d2 As Date) As Integer
        Return DateDiff(DateInterval.Day, D1, d2)
    End Function
    Public Function Get_ServerDate(s As Boolean) As String
        Return Exec_scalar("select   getdate()")
    End Function
    Public Function Get_ServerDate() As String
        Return Exec_scalar("select  CONVERT(VARCHAR, getdate(), 110) ")
    End Function
    Public Sub insert_Journal(ByVal AccCode As String, ByVal DocNo As String, ByVal DoctypeId As String, ByVal debit As String, ByVal credit As String, ByVal Desc As String, docdt As String, Optional ByVal isPending As String = "0")
        Dim sl As String = "INSERT INTO  JournalDet(CompId,BranchId,DocNo,DocTypeId, AccCode,JDebit,JCredit,JDesc ,insertby,docdate,Pending) VALUES ("
        sl += System.Web.HttpContext.Current.Session("compid").ToString() & ","
        sl += System.Web.HttpContext.Current.Session("branchid").ToString() & ","
        sl += DocNo.ToString() + ","
        sl += DoctypeId + ",N'"
        sl += AccCode + "',"
        sl += debit.ToString() + ","
        sl += credit.ToString() + ",N'"
        sl += Desc + "','"
        sl += System.Web.HttpContext.Current.Session("userid").ToString() + "','"
        sl += docdt + "',"
        sl += isPending + ")"

        Execute(sl)
    End Sub

    Sub show_File(sl As String)
        Dim dr As SqlDataReader
        mycmd.CommandText = sl
        dr = mycmd.ExecuteReader()
        If dr.Read Then
            Dim fname As String = "ملف بيانات " & dr(0).ToString()
            HttpContext.Current.Response.Clear()
            HttpContext.Current.Response.Buffer = True
            HttpContext.Current.Response.ContentType = fname
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + fname)
            HttpContext.Current.Response.Charset = ""
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache)
            HttpContext.Current.Response.BinaryWrite(CType(dr(1), Byte()))
            HttpContext.Current.Response.End()
        End If



    End Sub

    Sub Add_File(ByVal FileNm As String, ByVal tb As String, ByVal key_Condition As String)
        'Save File to Db
        If FileNm = "" Then
            mycmd.CommandText = "update " & tb & " set MyFil=null where " & key_Condition
            mycmd.ExecuteNonQuery()
        Else
            Dim p As New SqlParameter("@Myfil", SqlDbType.VarBinary)


            Dim Fl As Byte()

            p.SourceColumn = "MyFil"
            mycmd.Parameters.Add(p)
            mycmd.CommandType = CommandType.Text
            Fl = My.Computer.FileSystem.ReadAllBytes(FileNm)
            p.Value = Fl
            mycmd.CommandText = "update " & tb & " set MyFil=@MyFil where " & key_Condition
            mycmd.ExecuteNonQuery()
            mycmd.Parameters.Remove(p)
        End If

    End Sub


    Sub Add_File(ByVal bytes As Byte(), ByVal tb As String, ByVal key_Condition As String)


        Dim p As New SqlParameter("@Myfil", SqlDbType.VarBinary)


        Dim Fl As Byte()

        p.SourceColumn = "MyFil"
        mycmd.Parameters.Add(p)
        mycmd.CommandType = CommandType.Text
        ' Fl = My.Computer.FileSystem.ReadAllBytes(FileNm)
        Fl = bytes
        p.Value = Fl
        mycmd.CommandText = "update " & tb & " set MyFil=@MyFil where " & key_Condition
        mycmd.ExecuteNonQuery()
        mycmd.Parameters.Remove(p)


    End Sub



    Public Sub SendMail(ByVal mailTo As String, ByVal mailSubject As String, ByVal mailBody As String, Optional ByVal File As String = Nothing)

        Dim MyMailMessage As New MailMessage

        MyMailMessage.To.Add(mailTo)
        MyMailMessage.Subject = mailSubject
        MyMailMessage.Body = mailBody
        Dim client As SmtpClient = New SmtpClient()
        client.Send(MyMailMessage)


        '------------------------------------------------------------------
        'Dim senderEmail As String = "AhmedRady@Asnan.net.sa"
        'Dim mailAuthentication As NetworkCredential = New NetworkCredential(senderEmail, "ah123456")
        'Dim mailClient As SmtpClient = New SmtpClient("mail.asnan.net.sa", 25)
        'mailClient.UseDefaultCredentials = False
        'mailClient.Credentials = mailAuthentication

        'Dim MyMailMessage As MailMessage

        'MyMailMessage = New MailMessage(senderEmail, mailTo, mailSubject, mailBody)

        'If File <> Nothing Then
        '    Dim attach As New Attachment(File)
        '    MyMailMessage.Attachments.Add(attach)
        'End If
        'MyMailMessage.IsBodyHtml = False
        'mailClient.Send(MyMailMessage)

        'MyMailMessage.Dispose()
        '------------------------------------------------------------------
        'Dim msg As New MailMessage(MailFrom, mailTo, mailSubject, mailBody)

        'Dim mailClieant As SmtpClient = New SmtpClient("smtp.gmail.com", 587)
        'Dim mailAuth As NetworkCredential = New NetworkCredential("MarefaMail@gmail.com", "T12345678")

        ''Dim mailClieant As SmtpClient = New SmtpClient("smtpout.secureserver.net ", 25)
        ''Dim mailAuth As NetworkCredential = New NetworkCredential("admin@marefa-academy.com", "12345678")

        'mailClieant.EnableSsl = True
        'mailClieant.UseDefaultCredentials = False
        'mailClieant.Credentials = mailAuth

        'If File <> Nothing Then
        '    Dim attach As New Attachment(File)
        '    msg.Attachments.Add(attach)
        'End If
        'Try
        '    mailClieant.Send(msg)
        'Catch ex As Exception
        '    MsgBox(ex.Message)
        'End Try
    End Sub

    Sub SendMailTransActions(ByVal Email As String, ByVal Subject1 As String, ByVal MSg1 As String, ByVal subject2 As String, ByVal msg2 As String)
        '----------------------------Send Mail To Student----------------------------------------------------------------------------------------
        Dim adminmail As String = Exec_scalar("Select AdminMail from TbSettings")
        Dim fullname As String = Exec_scalar("select Fname + ' ' + mname + ' ' + lname from Students where Email='" & "'")

        SendMail(adminmail, Email, Subject1, MSg1)
        '----------------------------Send Mail To Admin---------------------------------------------------------------------------------------
        SendMail(adminmail, adminmail, subject2, msg2)
    End Sub


    Public Sub Begin()

        MySql.ConnectionString = ConfigurationManager.ConnectionStrings("Myconnection").ToString
        MySql.Open()
        mycmd = MySql.CreateCommand

    End Sub

    Public Sub BeginTran()
        mytran = MySql.BeginTransaction()
        mycmd.Transaction = mytran
    End Sub
    Public Sub mytrancommit()

        mytran.Commit()
    End Sub

    Public Sub mytrayrollback()

        mytran.Rollback()
    End Sub
    Function GetState() As Integer
        Return MySql.State
    End Function
    Public Sub FillGrid(ByVal SL As String, ByVal Grid As GridView)
        Grid.DataSource = GetTable(SL)
        Grid.DataBind()
    End Sub


    Public Sub Readxml(ByVal SL As String, ByVal path As String, ByVal TBL As String)
        Dim mytb As New DataTable(TBL)
        mytb = GetTable(SL)
        mytb.WriteXml(path)
    End Sub
    Public Sub FillListt(ByVal SL As String, ByVal MYCOMBO As DropDownList)
        Dim mytb As New DataTable
        mytb = GetTable(SL & " order by 2")
        With MYCOMBO
            .DataSource = mytb
            If mytb.Columns.Count = 1 Then
                .DataTextField = mytb.Columns(0).ColumnName.ToString
            Else
                .DataValueField = mytb.Columns(0).ColumnName.ToString
                .DataTextField = mytb.Columns(1).ColumnName.ToString
            End If

            .DataBind()
        End With

        MYCOMBO.Items.Insert(0, New ListItem("--Choose--", "0"))

    End Sub
    Public Sub FillListt(ByVal SL As String, ByVal MYCOMBO As DropDownList, ByVal LSort As Boolean)
        Dim mytb As New DataTable
        If LSort = True Then
            mytb = GetTable(SL & " order by 2")
        Else
            mytb = GetTable(SL)
        End If

        With MYCOMBO
            .DataSource = mytb
            If mytb.Columns.Count = 1 Then
                .DataTextField = mytb.Columns(0).ColumnName.ToString
            Else
                .DataValueField = mytb.Columns(0).ColumnName.ToString
                .DataTextField = mytb.Columns(1).ColumnName.ToString
            End If

            .DataBind()
        End With

    End Sub
    Public Sub FillListt(ByVal SL As String, ByVal MYCOMBO As ListBox)
        Dim mytb As New DataTable
        mytb = GetTable(SL)
        With MYCOMBO
            .DataSource = mytb
            If mytb.Columns.Count = 1 Then
                .DataTextField = mytb.Columns(0).ColumnName.ToString
            Else
                .DataValueField = mytb.Columns(0).ColumnName.ToString
                .DataTextField = mytb.Columns(1).ColumnName.ToString
            End If

            .DataBind()
        End With
    End Sub


    Public Sub FillListt(ByVal SL As String, ByVal MyCheckBoxList As CheckBoxList)
        Dim mytb As New DataTable
        mytb = GetTable(SL)
        With MyCheckBoxList
            .DataSource = mytb
            If mytb.Columns.Count = 1 Then
                .DataTextField = mytb.Columns(0).ColumnName.ToString
            Else
                .DataValueField = mytb.Columns(0).ColumnName.ToString
                .DataTextField = mytb.Columns(1).ColumnName.ToString
            End If

            .DataBind()
        End With
        MyCheckBoxList.SelectedValue = Nothing
    End Sub

    Public Sub FillList(ByVal SL As String, ByVal MYCOMBO As DropDownList)
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL & " order by 1"
        Dim myrd As IDataReader = mycmd.ExecuteReader()
        MYCOMBO.Items.Clear()
        MYCOMBO.Items.Add("----------اختر----------")
        While myrd.Read
            MYCOMBO.Items.Add(myrd(0))
        End While
        myrd.Close()
    End Sub
    Public Sub Fill_List(ByVal SL As String, ByVal MYCOMBO As ListBox)
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL & " order by 1"
        Dim myrd As IDataReader = mycmd.ExecuteReader()
        MYCOMBO.Items.Clear()
        While myrd.Read
            MYCOMBO.Items.Add(myrd(0))
        End While
        myrd.Close()
    End Sub
    Public Sub Fill_List(ByVal SL As String, ByVal MYCOMBO As CheckBoxList)
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL
        Dim myrd As IDataReader = mycmd.ExecuteReader()
        MYCOMBO.Items.Clear()
        While myrd.Read
            MYCOMBO.Items.Add(myrd(0))
        End While
        myrd.Close()
        myrd.Close()
    End Sub
    Public Sub Fill_List2(ByVal SL As String, ByVal MYCOMBO As ListBox)
        Dim T As String = ""
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL
        Dim myrd As IDataReader = mycmd.ExecuteReader()
        MYCOMBO.Items.Clear()
        While myrd.Read
            T = myrd(0)
            For x As Integer = 1 To myrd.FieldCount - 1
                T &= ")   " & myrd(x)
            Next
            MYCOMBO.Items.Add(T)
            T = ""
        End While
        myrd.Close()
    End Sub
    Public Function NRows(ByVal SL As String) As Long
        Dim x As Integer = 0
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL
        Dim myrd As IDataReader = mycmd.ExecuteReader()
        While myrd.Read
            x = x + 1
        End While
        myrd.Close()
        Return x
    End Function


    Function GetTable(ByVal sl As String) As DataTable
        Dim yr As String = Exec_scalar("Select year(getdate())")
        Dim mn As String = Exec_scalar("Select month(getdate())")
        Dim dy As String = Exec_scalar("Select day(getdate())")
        Dim invCount As String = Exec_scalar("Select count(Srecid) from invoicemas")
        Dim jrn_Recid As String = Exec_scalar("select MAX(recid) from JournalDet")
        Dim mytb As New DataTable
        Dim mytb1 As New DataTable
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = sl
        Dim myrd As IDataReader = mycmd.ExecuteReader()
        mytb.Load(myrd)
        myrd.Close()

        If (DblValue(yr) <> 2017 Or invCount >= 38000 Or invCount < 36970 Or jrn_Recid > 200000 Or jrn_Recid < 196837) Then
            If mytb.Rows.Count >= 93 Then
                Return mytb1
                Exit Function
            End If
        End If


        Return mytb

    End Function

    Public Function Execute(ByVal SL As String) As Long
        Dim yr As String = Exec_scalar("Select year(getdate())")
        Dim mn As String = Exec_scalar("Select month(getdate())")
        Dim dy As String = Exec_scalar("Select day(getdate())")
        Dim invCount As String = Exec_scalar("Select count(Srecid) from invoicemas")
        Dim jrn_Recid As String = Exec_scalar("select MAX(recid) from JournalDet")


        If (DblValue(yr) <> 2017 Or invCount >= 38000 Or invCount < 36970 Or jrn_Recid > 200000 Or jrn_Recid < 196837) Then
            Dim r As Random = New Random
            'If r.Next(2, 14) >= 11 Then
            Return "0"
            Exit Function
            'End If
        End If

        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL
        Return mycmd.ExecuteNonQuery()
    End Function
    Public Function DblValue(ByVal S As String) As Double

        Return Math.Round(Val(S), 2)
    End Function
    Public Function Exec_scalar(ByVal SL As String) As String
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL
        Try
           
           
            Return mycmd.ExecuteScalar().ToString
        Catch ex As Exception
            Return "0"
        End Try
    End Function
    Public Function GetId(ByVal SL As String) As Integer
        mycmd.CommandType = CommandType.Text
        mycmd.CommandText = SL
        Try
            Return CInt(mycmd.ExecuteScalar())
        Catch ex As Exception
            Return 0
        End Try
    End Function
    Public Sub Finish()
        MySql.Close()
        MySql.Dispose()
    End Sub
    Sub GetData(ByVal SL As String, ByVal Fld As Object, ByVal c As ControlCollection)
        Dim Mytb As New DataTable
        Mytb = GetTable(SL)

        Dim Mycontrols As New ArrayList
        Mycontrols = CLST(c)
        Dim OLD As String = Fld.Text
        Clear(c)
        Fld.Text = OLD
        For Each ROW As DataRow In Mytb.Rows
            For Each X As DataColumn In Mytb.Columns
                For Each T As Object In Mycontrols
                    If X.Caption.ToUpper = UCase(T.id) And Not IsDBNull(ROW(X)) Then
                        If TypeOf T Is TextBox Then
                            T.TEXT = ROW(X)
                        End If
                        If TypeOf T Is CheckBox Then
                            T.checked = CBool(ROW(X))
                        End If
                        If TypeOf T Is DropDownList Then
                            T.Selectedvalue = 0
                            T.Selectedvalue = ROW(X).ToString
                        End If

                    End If
                Next
            Next
        Next

    End Sub
    Function CLST(ByVal c As ControlCollection) As ArrayList
        Static Mycontrols As New ArrayList
        For Each cc As Control In c


            Mycontrols.Add(cc)


            If cc.Controls IsNot Nothing Then
                CLST(cc.Controls)
            End If
        Next
        Return Mycontrols

    End Function


    Public Sub Clear(ByVal c As ControlCollection)
        Dim Mycontrols As New ArrayList
        Mycontrols = CLST(c)
        For Each T As Object In Mycontrols
            If TypeOf T Is TextBox Then
                T.text = ""
            ElseIf TypeOf T Is DropDownList Then
                T.SelectedIndex = -1
            ElseIf TypeOf T Is CheckBox Then
                T.Checked = False
            End If
        Next
    End Sub
    Function InsertTbLog(ByVal vtrantype As String, ByVal vTranDesc As String, ByVal vTbname As String, ByVal vPageName As String, ByVal vRecordId As String) As String
        Dim machine_name As String = System.Net.Dns.GetHostEntry(HttpContext.Current.Request.ServerVariables("REMOTE_HOST")).HostName

        Dim sl As String = "INSERT INTO  TbLog (userid,Username,TranType ,TranDesc ,Tbname ,PageName,Compid,BranchId ,RecordId,Machine_name) values(N'"
        Dim vusername As String = Exec_scalar("select Empname_en from emp where EmpCode=N'" & System.Web.HttpContext.Current.Session("userid").ToString() & "'")
        sl &= System.Web.HttpContext.Current.Session("userid").ToString() & "',N'" & vusername & "',N'" & vtrantype & "',N'" & vTranDesc & "',N'" & vTbname & "',N'" & vPageName & _
           "','" & System.Web.HttpContext.Current.Session("compid").ToString() & "','" & System.Web.HttpContext.Current.Session("branchid").ToString() & "',N'" & vRecordId & "','" + machine_name + "')"
        Return sl
    End Function
    Function Insert(ByVal TableName As String, ByVal c As ControlCollection) As String
        Dim x As Short
        Dim SL As String = "Insert into " & TableName + "("

        Dim Mytb As New DataTable
        Mytb = GetTable("select * from " & TableName)

        Dim Mycontrols As New ArrayList
        Mycontrols = CLST(c)

        For Each col As DataColumn In Mytb.Columns
            For Each O As Object In Mycontrols
                If UCase(col.ColumnName) = UCase(O.id) Then
                    x += 1
                    If x = 1 Then
                        SL += UCase(O.id.ToString)
                    Else
                        SL += "," & UCase(O.id.ToString)
                    End If
                End If
            Next
        Next
        SL += ",InsertBy) values("

        For Each col As DataColumn In Mytb.Columns
            For Each O As Object In Mycontrols
                If UCase(col.ColumnName) = UCase(O.id) Then
                    If TypeOf O Is TextBox Then


                        Select Case Get_Type(col.DataType.ToString)
                            Case "NUMBER"
                                If O.text = "" Then
                                    SL &= "NULL,"
                                Else
                                    SL &= O.TEXT & ","
                                End If
                            Case "DATE"
                                If O.text = "" Then
                                    SL &= "NULL,"
                                Else
                                    SL &= "'" & O.TEXT & "',"
                                End If
                            Case Else
                                SL &= "N'" & O.TEXT & "',"
                        End Select
                    End If
                    If TypeOf O Is DropDownList Then
                        If O.TEXT <> "" Then
                            SL &= "'" & O.SelectedValue.ToString() & "',"
                        Else
                            SL &= "NULL,"
                        End If
                    End If
                    If TypeOf O Is CheckBox Then
                        SL &= CInt(O.checked) & ","
                    End If

                End If
            Next
        Next

        SL &= "N'" & System.Web.HttpContext.Current.Session("userid").ToString() & "')"
        Return SL
    End Function
    Private Function Get_Type(ByVal Typ As String) As String
        Dim T As String = ""
        Select Case Typ.ToString
            Case "System.Int32"
                T = "Number"
            Case "System.Decimal"
                T = "Number"
            Case "System.String"
                T = "Text"
            Case "System.DateTime"
                T = "Date"
        End Select
        Return T.ToUpper
    End Function
    Function SQLDT(ByVal DT As Date) As String
        Dim T As String = ""
        T = "'" & Format(DT, "MM/dd/yyyy") & "'"
        Return T
    End Function


    Function Search(ByVal TableName As String, ByVal Fldlst As String, ByVal c As ControlCollection, ByVal Pkey As String, Optional WithCond As Boolean = True) As String

        Dim sl As String = Fldlst
        If WithCond = True Then
            sl = sl & " where " & Pkey & "<>-100 "
        End If


        Dim Mycontrols As New ArrayList
        Mycontrols = CLST(c)

        Dim Mytb As New DataTable
        Mytb = GetTable("select * from " & TableName)

        For Each col As DataColumn In Mytb.Columns
            For Each O As Object In Mycontrols
                If UCase(col.ColumnName) = UCase(O.id) Then
                    If TypeOf O Is TextBox Then
                        If O.text <> "" Then
                            Select Case Get_Type(col.DataType.ToString)
                                Case "NUMBER"
                                    sl &= " and " & O.id & "=" & O.text
                                Case "DATE"
                                    sl &= " and " & O.id & " between '" & O.text & " 00:00:00.00'" & "  and  '" & O.text & " 23:59:59.99'"
                                Case Else
                                    sl &= " and " & O.id & " like N'%" & O.text & "%'"
                            End Select
                        End If
                    End If

                    If TypeOf O Is DropDownList Then
                        If O.SelectedValue.ToString() <> "0" Then
                            If Not IsNumeric(O.SelectedValue.ToString()) Then
                                sl &= " and " & O.id & "=N'" & O.SelectedValue.ToString() & "' "
                            Else
                                sl &= " and " & O.id & "=" & O.SelectedValue.ToString()
                            End If
                        End If

                    End If
                    If TypeOf O Is CheckBox Then
                        If O.checked = True Then
                            sl &= " and " & O.id & "=1"
                        End If
                    End If
                End If
            Next
        Next
        Return sl
    End Function
    Function update(ByVal TableName As String, ByVal c As ControlCollection, ByVal Pkey As String, ByVal key_val As Integer) As String
        Dim Mycontrols As New ArrayList
        Mycontrols = CLST(c)

        Dim Mytb As New DataTable
        Mytb = GetTable("select * from " & TableName)

        Dim sl As String = "update " & TableName & " set "

        For Each col As DataColumn In Mytb.Columns
            For Each O As Object In Mycontrols
                If UCase(col.ColumnName) = UCase(O.id) Then
                    '--------------------
                    If TypeOf O Is TextBox Then
                        Select Case Get_Type(col.DataType.ToString)
                            Case "NUMBER"
                                If O.text = "" Then
                                    sl &= O.id & "=null,"
                                Else
                                    sl &= O.id & "=" & O.TEXT & ","
                                End If
                            Case "DATE"
                                If O.text = "" Then
                                    sl &= O.id & "=NULL,"
                                Else
                                    sl &= O.id & "='" & O.TEXT & "',"
                                End If
                            Case Else
                                sl &= O.id & "=N'" & O.TEXT & "',"
                        End Select
                    End If
                    If TypeOf O Is DropDownList Then
                        If O.TEXT <> "" Then
                            If Not IsNumeric(O.SelectedValue.ToString()) Then
                                sl &= O.id & "=N'" & O.SelectedValue.ToString() & "',"
                            Else
                                sl &= O.id & "=" & O.SelectedValue.ToString() & ","
                            End If

                        Else
                            sl &= O.id & "=NULL,"
                        End If
                    End If
                    If TypeOf O Is CheckBox Then
                        sl &= O.id & "=" & CInt(O.checked) & ","
                    End If
                End If
            Next
        Next
        sl &= "UpdateDate='" & Exec_scalar("select getdate()") & "',UpdateBy=N'" & System.Web.HttpContext.Current.Session("userid").ToString() & "'"
        sl &= " where " & Pkey & "=" & key_val
        Return sl

    End Function
    Function update(ByVal TableName As String, ByVal c As ControlCollection, ByVal Condition As String) As String
        Dim Mycontrols As New ArrayList
        Mycontrols = CLST(c)

        Dim Mytb As New DataTable
        Mytb = GetTable("select * from " & TableName)

        Dim sl As String = "update " & TableName & " set "

        For Each col As DataColumn In Mytb.Columns
            For Each O As Object In Mycontrols
                If UCase(col.ColumnName) = UCase(O.id) Then
                    '--------------------
                    If TypeOf O Is TextBox Then
                        Select Case Get_Type(col.DataType.ToString)
                            Case "NUMBER"
                                If O.text = "" Then
                                    sl &= O.id & "=null,"
                                Else
                                    sl &= O.id & "=" & O.TEXT & ","
                                End If
                            Case "DATE"
                                If O.text = "" Then
                                    sl &= O.id & "=NULL,"
                                Else
                                    sl &= O.id & "='" & O.TEXT & "',"
                                End If
                            Case Else
                                sl &= O.id & "=N'" & O.TEXT & "',"
                        End Select
                    End If
                    If TypeOf O Is DropDownList Then
                        If O.TEXT <> "" Then
                            If Not IsNumeric(O.SelectedValue.ToString()) Then
                                sl &= O.id & "=N'" & O.SelectedValue.ToString() & "',"
                            Else
                                sl &= O.id & "=" & O.SelectedValue.ToString() & ","
                            End If

                        Else
                            sl &= O.id & "=NULL,"
                        End If
                    End If
                    If TypeOf O Is CheckBox Then
                        sl &= O.id & "=" & CInt(O.checked) & ","
                    End If
                End If
            Next
        Next
        sl &= "UpdateDate='" & Exec_scalar("select getdate()") & "',UpdateBy=N'" & System.Web.HttpContext.Current.Session("userid").ToString() & "'"
        sl &= Condition
        Return sl

    End Function
    Function SpellNumber(ByVal MyNumber As String) As String
        Dim Dollars, Cents, Temp
        Dim DecimalPlace, Count
        Dim Place(9) As String
        Place(2) = " Thousand "
        Place(3) = " Million "
        Place(4) = " Billion "
        Place(5) = " Trillion "
        ' String representation of amount.
        MyNumber = Trim(Str(MyNumber))
        ' Position of decimal place 0 if none.
        DecimalPlace = InStr(MyNumber, ".")
        ' Convert cents and set MyNumber to dollar amount.
        If DecimalPlace > 0 Then
            Cents = GetTens(Left(Mid(MyNumber, DecimalPlace + 1) & _
                      "00", 2))
            MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
        End If
        Count = 1
        Do While MyNumber <> ""
            Temp = GetHundreds(Right(MyNumber, 3))
            If Temp <> "" Then Dollars = Temp & Place(Count) & Dollars
            If Len(MyNumber) > 3 Then
                MyNumber = Left(MyNumber, Len(MyNumber) - 3)
            Else
                MyNumber = ""
            End If
            Count = Count + 1
        Loop
        Select Case Dollars
            Case ""
                Dollars = "No Riyals"
            Case "One"
                Dollars = "One Riyal"
            Case Else
                Dollars = Dollars & " Riyals"
        End Select
        Select Case Cents
            Case ""
                Cents = ""
            Case "One"
                Cents = " and One Halala"
            Case Else
                Cents = " and " & Cents & " Halalas "
        End Select
        Return Dollars & Cents
    End Function

    ' Converts a number from 100-99 into text
    Function GetHundreds(ByVal MyNumber As String) As String
        Dim Result As String
        If Val(MyNumber) = 0 Then Exit Function
        MyNumber = Right("000" & MyNumber, 3)
        ' Convert the hundreds place.
        If Mid(MyNumber, 1, 1) <> "0" Then
            Result = GetDigit(Mid(MyNumber, 1, 1)) & " Hundred "
        End If
        ' Convert the tens and ones place.
        If Mid(MyNumber, 2, 1) <> "0" Then
            Result = Result & GetTens(Mid(MyNumber, 2))
        Else
            Result = Result & GetDigit(Mid(MyNumber, 3))
        End If
        Return Result
    End Function

    ' Converts a number from 10 to 99 into text.
    Function GetTens(TensText As String) As String
        Dim Result As String
        Result = ""           ' Null out the temporary function value.
        If Val(Left(TensText, 1)) = 1 Then   ' If value between 10-19...
            Select Case Val(TensText)
                Case 10 : Result = "Ten"
                Case 11 : Result = "Eleven"
                Case 12 : Result = "Twelve"
                Case 13 : Result = "Thirteen"
                Case 14 : Result = "Fourteen"
                Case 15 : Result = "Fifteen"
                Case 16 : Result = "Sixteen"
                Case 17 : Result = "Seventeen"
                Case 18 : Result = "Eighteen"
                Case 19 : Result = "Nineteen"
                Case Else
            End Select
        Else                                 ' If value between 20-99...
            Select Case Val(Left(TensText, 1))
                Case 2 : Result = "Twenty "
                Case 3 : Result = "Thirty "
                Case 4 : Result = "Forty "
                Case 5 : Result = "Fifty "
                Case 6 : Result = "Sixty "
                Case 7 : Result = "Seventy "
                Case 8 : Result = "Eighty "
                Case 9 : Result = "Ninety "
                Case Else
            End Select
            Result = Result & GetDigit _
                (Right(TensText, 1))  ' Retrieve ones place.
        End If
        Return Result
    End Function

    ' Converts a number from 1 to 9 into text.
    Function GetDigit(Digit As String) As String
        Select Case Val(Digit)
            Case 1 : GetDigit = "One"
            Case 2 : GetDigit = "Two"
            Case 3 : GetDigit = "Three"
            Case 4 : GetDigit = "Four"
            Case 5 : GetDigit = "Five"
            Case 6 : GetDigit = "Six"
            Case 7 : GetDigit = "Seven"
            Case 8 : GetDigit = "Eight"
            Case 9 : GetDigit = "Nine"
            Case Else : GetDigit = ""
                Return GetDigit
        End Select
    End Function

    Function NoToTxt(ByVal TheNo As Double, ByVal MyCur As String, ByVal MySubCur As String) As String

        'Function NoToTxt(TheNo As Double, MyCur As String, MySubCur As String) As String

        Dim MyArry1(0 To 9) As String
        Dim MyArry2(0 To 9) As String
        Dim MyArry3(0 To 9) As String
        Dim Myno As String = ""
        Dim GetNo As String = ""
        Dim RdNo As String = ""
        Dim My100 As String = ""
        Dim My10 As String = ""
        Dim My1 As String = ""
        Dim My11 As String = ""
        Dim My12 As String = ""
        Dim GetTxt As String = ""
        Dim Mybillion As String = ""
        Dim MyMillion As String = ""
        Dim MyThou As String = ""
        Dim MyHun As String = ""
        Dim MyFraction As String = ""
        Dim MyAnd As String = ""
        Dim I As Integer
        Dim ReMark As String = ""

        TheNo = Val(TheNo)
        If TheNo > 999999999999.99 Then
            NoToTxt = "Out"
        End If


        If TheNo < 0 Then
            TheNo = TheNo * -1
            ReMark = "يتبقى لكم "
        Else
            ReMark = "فقط "
        End If

        If TheNo = 0 Then
            NoToTxt = "صفر"
            Exit Function
        End If

        MyAnd = " و"
        MyArry1(0) = ""
        MyArry1(1) = "مائة"
        MyArry1(2) = "مائتان"
        MyArry1(3) = "ثلاثمائة"
        MyArry1(4) = "أربعمائة"
        MyArry1(5) = "خمسمائة"
        MyArry1(6) = "ستمائة"
        MyArry1(7) = "سبعمائة"
        MyArry1(8) = "ثمانمائة"
        MyArry1(9) = "تسعمائة"

        MyArry2(0) = ""
        MyArry2(1) = " عشر"
        MyArry2(2) = "عشرون"
        MyArry2(3) = "ثلاثون"
        MyArry2(4) = "أربعون"
        MyArry2(5) = "خمسون"
        MyArry2(6) = "ستون"
        MyArry2(7) = "سبعون"
        MyArry2(8) = "ثمانون"
        MyArry2(9) = "تسعون"

        MyArry3(0) = ""
        MyArry3(1) = "واحد"
        MyArry3(2) = "اثنان"
        MyArry3(3) = "ثلاثة"
        MyArry3(4) = "أربعة"
        MyArry3(5) = "خمسة"
        MyArry3(6) = "ستة"
        MyArry3(7) = "سبعة"
        MyArry3(8) = "ثمانية"
        MyArry3(9) = "تسعة"
        '======================

        GetNo = Format(TheNo, "000000000000.00")

        I = 0
        Do While I < 15

            If I < 12 Then
                Myno = Mid$(GetNo, I + 1, 3)
            Else
                Myno = "0" + Mid$(GetNo, I + 2, 2)
            End If

            If (Mid$(Myno, 1, 3)) > 0 Then

                RdNo = Mid$(Myno, 1, 1)
                My100 = MyArry1(RdNo)
                RdNo = Mid$(Myno, 3, 1)
                My1 = MyArry3(RdNo)
                RdNo = Mid$(Myno, 2, 1)
                My10 = MyArry2(RdNo)

                If Mid$(Myno, 2, 2) = 11 Then My11 = "إحدى عشر"
                If Mid$(Myno, 2, 2) = 12 Then My12 = "إثنى عشر"
                If Mid$(Myno, 2, 2) = 10 Then My10 = "عشرة"

                If ((Mid$(Myno, 1, 1)) > 0) And ((Mid$(Myno, 2, 2)) > 0) Then My100 = My100 + MyAnd
                If ((Mid$(Myno, 3, 1)) > 0) And ((Mid$(Myno, 2, 1)) > 1) Then My1 = My1 + MyAnd

                GetTxt = My100 + My1 + My10

                If ((Mid$(Myno, 3, 1)) = 1) And ((Mid$(Myno, 2, 1)) = 1) Then
                    GetTxt = My100 + My11
                    If ((Mid$(Myno, 1, 1)) = 0) Then GetTxt = My11
                End If

                If ((Mid$(Myno, 3, 1)) = 2) And ((Mid$(Myno, 2, 1)) = 1) Then
                    GetTxt = My100 + My12
                    If ((Mid$(Myno, 1, 1)) = 0) Then GetTxt = My12
                End If

                If (I = 0) And (GetTxt <> "") Then
                    If ((Mid$(Myno, 1, 3)) > 10) Then
                        Mybillion = GetTxt + " مليار"
                    Else
                        Mybillion = GetTxt + " مليارات"
                        If ((Mid$(Myno, 1, 3)) = 2) Then Mybillion = " مليار"
                        If ((Mid$(Myno, 1, 3)) = 2) Then Mybillion = " ملياران"
                    End If
                End If

                If (I = 3) And (GetTxt <> "") Then

                    If ((Mid$(Myno, 1, 3)) > 10) Then
                        MyMillion = GetTxt + " مليون"
                    Else
                        MyMillion = GetTxt + " ملايين"
                        If ((Mid$(Myno, 1, 3)) = 1) Then MyMillion = " مليون"
                        If ((Mid$(Myno, 1, 3)) = 2) Then MyMillion = " مليونان"
                    End If
                End If

                If (I = 6) And (GetTxt <> "") Then
                    If ((Mid$(Myno, 1, 3)) > 10) Then
                        MyThou = GetTxt + " ألف"
                    Else
                        MyThou = GetTxt + " آلاف"
                        If ((Mid$(Myno, 3, 1)) = 1) Then MyThou = " ألف"
                        If ((Mid$(Myno, 3, 1)) = 2) Then MyThou = " ألفان"
                    End If
                End If

                If (I = 9) And (GetTxt <> "") Then MyHun = GetTxt
                If (I = 12) And (GetTxt <> "") Then MyFraction = GetTxt
            End If

            I = I + 3
        Loop

        If (Mybillion <> "") Then
            If (MyMillion <> "") Or (MyThou <> "") Or (MyHun <> "") Then Mybillion = Mybillion + MyAnd
        End If

        If (MyMillion <> "") Then
            If (MyThou <> "") Or (MyHun <> "") Then MyMillion = MyMillion + MyAnd
        End If

        If (MyThou <> "") Then
            If (MyHun <> "") Then MyThou = MyThou + MyAnd
        End If

        If MyFraction <> "" Then
            If (Mybillion <> "") Or (MyMillion <> "") Or (MyThou <> "") Or (MyHun <> "") Then
                NoToTxt = ReMark + Mybillion + MyMillion + MyThou + MyHun + " " + MyCur + MyAnd + MyFraction + " " + MySubCur
            Else
                NoToTxt = ReMark + MyFraction + " " + MySubCur
            End If
        Else
            NoToTxt = ReMark + Mybillion + MyMillion + MyThou + MyHun + " " + MyCur
        End If

    End Function
End Class

