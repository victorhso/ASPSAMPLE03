<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ASPSAMPLE03.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idPessoa" DataSourceID="EntityDataSource1" ForeColor="#333333" GridLines="None" Height="125px" Width="238px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="delete" runat="server" CausesValidation="False" CommandName="Delete" Text="Excluir" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Link" SelectText="Editar" ShowSelectButton="true" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>

            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=sampledbEntities" DefaultContainerName="sampledbEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Pessoas">
            </asp:EntityDataSource>

            <br />

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idPessoa" DataSourceID="EntityDataSource2" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated">
                <EditItemTemplate>
                    idPessoa:
                    <asp:Label ID="idPessoaLabel1" runat="server" Text='<%# Eval("idPessoa") %>' />
                    <br />
                    Nome:
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                    <br />
                    Telefone:
                    <asp:TextBox ID="TelefoneTextBox" runat="server" Text='<%# Bind("Telefone") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Atualizar" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Nome:
                    <asp:TextBox ID="NomeTextBox" runat="server" Text='<%# Bind("Nome") %>' />
                    <br />
                    Telefone:
                    <asp:TextBox ID="TelefoneTextBox" runat="server" Text='<%# Bind("Telefone") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Inserir" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar" />
                </InsertItemTemplate>
                <ItemTemplate>
                    idPessoa:
                    <asp:Label ID="idPessoaLabel" runat="server" Text='<%# Eval("idPessoa") %>' />
                    <br />
                    Nome:
                    <asp:Label ID="NomeLabel" runat="server" Text='<%# Bind("Nome") %>' />
                    <br />
                    Telefone:
                    <asp:Label ID="TelefoneLabel" runat="server" Text='<%# Bind("Telefone") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Excluir" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Novo" />
                </ItemTemplate>
            </asp:FormView>
            <br />

            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=sampledbEntities" DefaultContainerName="sampledbEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Pessoas" Where="it.idPessoa = @idPessoa">
                <WhereParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="idPessoa" PropertyName="SelectedValue" Type="Int32" />
                </WhereParameters>
            </asp:EntityDataSource>
        </div>
    </form>
</body>
</html>
