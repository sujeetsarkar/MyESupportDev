﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MOM.aspx.cs" Inherits="eSupport.UI.WebForm6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                contentType: 'application/json; charset=utf-8',
                url: 'MOM.aspx/BindMOMTable',
                data: "{}",
                dataType: 'json',
                dataSrc:"",
                success: function (data) {    
                  
                    var result = JSON.parse(data.d);

                    $('#datatable-buttons-MOM').find('tbody').empty();
                     for (var i = 0; i < result.length; i++) {
                         $('#datatable-buttons-MOM').append("<tr><td>" + result[i].tempDate + "</td><td>" + result[i].Title + "</td><td>" + result[i].tempFacilitator + "</td><td>" + result[i].tempRecorder + "</td><td>" + result[i].LocationDetails + "</td></tr>");
                    }
                    $('#datatable-buttons-MOM').dataTable({
                         dom: 'Bfrtip',
                         buttons: [{
                             extend: 'copy',
                             text: 'Copy',
                             className: 'btn-sm'
                         },
                         {
                             extend: 'csv',
                             text: 'CSV File',
                             className: 'btn-sm'

                         },
                         {
                             extend: 'print',
                             text: 'Print',
                             className:'btn-sm'
                         },
                         {
                             extend: 'excel',
                             text: 'Get Excel',
                             className: 'btn-sm'
                         },
                         {
                             extend: 'pdfHtml5',
                             text: 'PDF',
                             className: 'btn-sm'
                         }
                         ]                  
                    });
                }          
            });  
        });

</script>

    <style type="text/css">
        @media screen and (min-width: 769px) {

            td {
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
            }

            table {
                table-layout: fixed;
                width: 100%;
            }
        }
    </style>
    <!-- page content -->
    <div class="right_col" role="main">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>List of MOM's</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li>
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#">Settings 1</a>
                                </li>
                                <li>
                                    <a href="#">Settings 2</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <div class="row">
                        <div class="col-xs-12">
                            <p class="text-muted">This is the list of MOM's coming under the support scope of <b>Boral App Support</b></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-offset-11 col-xs-offset-1">
                            <a class="btn btn-primary" id="btnAddMOM" href="AddMOM.aspx">
                                <i class="fa fa-plus-square-o fa-lg"></i>Add </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-offset-11 col-xs-offset-1">
                            <a class="btn btn-primary" id="btnEditMOM" href="AddMOM.aspx">
                                <i class="fa fa-plus-square-o fa-lg"></i>Edit </a>
                        </div>
                    </div>

                    <div class="table-responsive col-xs-12">
                        <table id="datatable-buttons-MOM" class="table table-responsive table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Meeting Date</th>
                                    <th>Title</th>
                                    <th>Facilitator</th>
                                    <th>Recorder</th>
                                    <th>Location</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /page content -->
    <!-- jQuery -->
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <!-- Bootstrap -->
    <script src="Scripts/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="Scripts/fastclick.js"></script>
    <!-- NProgress -->
    <script src="Scripts/nprogress.js"></script>

    <script src="Libs/Chart.js/dist/Chart.min.js"></script>

    <script src="Libs/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

    <script src="Libs/iCheck/icheck.min.js"></script>

    <script src="Scripts/moment.min.js"></script>

    <script src="Scripts/daterangepicker.js"></script>

    <script src="Scripts/respond.min.js"></script>

    <!-- EChart-->
    <script src="Libs/echarts/dist/echarts.min.js"></script>

    <script src="Libs/Gentelella/js/custom.js"></script>
    <!--DataTable-->
    <script src="Libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="Libs/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script>
        $(document).ready(function () {
            var theme = {
                color: [
                    '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
                    '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
                ],

                title: {
                    itemGap: 8,
                    textStyle: {
                        fontWeight: 'normal',
                        color: '#408829'
                    }
                },

                dataRange: {
                    color: ['#1f610a', '#97b58d']
                },

                toolbox: {
                    color: ['#408829', '#408829', '#408829', '#408829']
                },

                tooltip: {
                    backgroundColor: 'rgba(0,0,0,0.5)',
                    axisPointer: {
                        type: 'line',
                        lineStyle: {
                            color: '#408829',
                            type: 'dashed'
                        },
                        crossStyle: {
                            color: '#408829'
                        },
                        shadowStyle: {
                            color: 'rgba(200,200,200,0.3)'
                        }
                    }
                },

                dataZoom: {
                    dataBackgroundColor: '#eee',
                    fillerColor: 'rgba(64,136,41,0.2)',
                    handleColor: '#408829'
                },
                grid: {
                    borderWidth: 0
                },

                categoryAxis: {
                    axisLine: {
                        lineStyle: {
                            color: '#408829'
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: ['#eee']
                        }
                    }
                },

                valueAxis: {
                    axisLine: {
                        lineStyle: {
                            color: '#408829'
                        }
                    },
                    splitArea: {
                        show: true,
                        areaStyle: {
                            color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
                        }
                    },
                    splitLine: {
                        lineStyle: {
                            color: ['#eee']
                        }
                    }
                },
                timeline: {
                    lineStyle: {
                        color: '#408829'
                    },
                    controlStyle: {
                        normal: { color: '#408829' },
                        emphasis: { color: '#408829' }
                    }
                },

                k: {
                    itemStyle: {
                        normal: {
                            color: '#68a54a',
                            color0: '#a9cba2',
                            lineStyle: {
                                width: 1,
                                color: '#408829',
                                color0: '#86b379'
                            }
                        }
                    }
                },
                map: {
                    itemStyle: {
                        normal: {
                            areaStyle: {
                                color: '#ddd'
                            },
                            label: {
                                textStyle: {
                                    color: '#c12e34'
                                }
                            }
                        },
                        emphasis: {
                            areaStyle: {
                                color: '#99d2dd'
                            },
                            label: {
                                textStyle: {
                                    color: '#c12e34'
                                }
                            }
                        }
                    }
                },
                force: {
                    itemStyle: {
                        normal: {
                            linkStyle: {
                                strokeColor: '#408829'
                            }
                        }
                    }
                },
                chord: {
                    padding: 4,
                    itemStyle: {
                        normal: {
                            lineStyle: {
                                width: 1,
                                color: 'rgba(128, 128, 128, 0.5)'
                            },
                            chordStyle: {
                                lineStyle: {
                                    width: 1,
                                    color: 'rgba(128, 128, 128, 0.5)'
                                }
                            }
                        },
                        emphasis: {
                            lineStyle: {
                                width: 1,
                                color: 'rgba(128, 128, 128, 0.5)'
                            },
                            chordStyle: {
                                lineStyle: {
                                    width: 1,
                                    color: 'rgba(128, 128, 128, 0.5)'
                                }
                            }
                        }
                    }
                },
                gauge: {
                    startAngle: 225,
                    endAngle: -45,
                    axisLine: {
                        show: true,
                        lineStyle: {
                            color: [[0.2, '#86b379'], [0.8, '#68a54a'], [1, '#408829']],
                            width: 8
                        }
                    },
                    axisTick: {
                        splitNumber: 10,
                        length: 12,
                        lineStyle: {
                            color: 'auto'
                        }
                    },
                    axisLabel: {
                        textStyle: {
                            color: 'auto'
                        }
                    },
                    splitLine: {
                        length: 18,
                        lineStyle: {
                            color: 'auto'
                        }
                    },
                    pointer: {
                        length: '90%',
                        color: 'auto'
                    },
                    title: {
                        textStyle: {
                            color: '#333'
                        }
                    },
                    detail: {
                        textStyle: {
                            color: 'auto'
                        }
                    }
                },
                textStyle: {
                    fontFamily: 'Arial, Verdana, sans-serif'
                }
            };
        });
    </script>
</asp:Content>
