<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebServiceStudentDemo.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        function GetStudentById() {
            var id = document.getElementById("txtID").value;
            WebServiceStudentDemo.StudentWebService.GetStudentById(id,GetStudentByIdSuccessCallBack, GetStudentByIdFaild);
        }
        function GetStudentByIdSuccessCallBack(result) {
            document.getElementById("txtName").value = result["Name"];
            document.getElementById("txtGender").value = result["Gender"];
            document.getElementById("txtTotal").value = result["TotalMarks"];
        }
        function GetStudentByIdFaild(errors) {
            alert("Errooooooooor");
        }
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
            <asp:ServiceReference Path="~/StudentWebService.asmx" />
            </Services>
        </asp:ScriptManager>
        <div style="width: 398px">
            <table style="width: 396px">
                <tr>
                    <td>ID :</td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <input id="Button1" type="button" value="Get Student" width="105px" onclick="GetStudentById();" />
                    </td>
                </tr>
                <tr>
                    <td>Name :</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Gender :</td>
                    <td>
                        <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Total Marks</td>
                    <td>
                        <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox>
                    </td>
                </tr>

            </table>
        </div>
    </form>
</body>
</html>
