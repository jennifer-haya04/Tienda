<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultar.aspx.cs" Inherits="Tienda.Consultar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3>Consulta</h3>
    <div class="combo-consulta">
        <div>
            <label>CATEGORIA:</label>
            <asp:DropDownList ID="ddlCategoriaConsulta" runat="server" OnSelectedIndexChanged="filtrar"></asp:DropDownList>
        </div>
        <div>
            <label>MARCA:</label>
            <asp:DropDownList ID="ddlMarcaConsulta" runat="server"></asp:DropDownList>
        </div>
    </div>

    <div class="prodDivision">
        <asp:Repeater ID="rptDatos" runat="server">
            <ItemTemplate>
                <div class="productoconsulta">
                    <p><%#Eval("Categoria") %></p>
                    <div class="productodetalleConsulta">
                        <div>
                            <h2><%#Eval("Nombre") %></h2>
                            <h3><%#Eval("Marca") %></h3>
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
                            <h3><%#Eval("Observacion") %></h3>
                        </div>
                        <div>
                        <img class="producto-foto" src="<%#Eval("Foto") %>" alt="<%#Eval("Nombre") %>"/>
                        </div>
                    </div>
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>


</asp:Content>
