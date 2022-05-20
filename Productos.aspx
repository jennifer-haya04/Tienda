<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="Tienda.Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Listado de Productos</h2>
    <a href="productoCrear.aspx" class="boton">
        <i class="fa-solid fa-plus"></i>
        Agregar Producto
    </a>

    <asp:GridView ID="grvDatos" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal">
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
    <hr />
    <div class="prodDivision">
        <asp:Repeater ID="rptDatos" runat="server">
            <ItemTemplate>
                <div class="producto">
                    <div>
                        <img class="producto-foto" src="<%#Eval("Foto") %>" alt="<%#Eval("Nombre") %>"/>
                    </div>
                    <div class="productodetalle">
                        <h3><%#Eval("Nombre") %></h3>
                        <p><%#Eval("Marca") %></p>
                        <p><%#Eval("Categoria") %></p>
                        <div class="productoInfo">
                            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-report-money" width="20" height="20" viewBox="0 0 24 24" stroke-width="1.5" stroke="#00abfb" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
                                <path d="M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2" />
                                <rect x="9" y="3" width="6" height="4" rx="2" />
                                <path d="M14 11h-2.5a1.5 1.5 0 0 0 0 3h1a1.5 1.5 0 0 1 0 3h-2.5" />
                                <path d="M12 17v1m0 -8v1" />
                            </svg>
                            <p><%#Eval("Precio") %></p>
                        </div>

                    </div>
                    <a href="Producto_Editar.aspx?id=<%#Eval("IdProducto")%>">Editar</a>
                    <a href="Producto_Editar.aspx?id=<%#Eval("IdProducto")%>">Eliminar</a>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
