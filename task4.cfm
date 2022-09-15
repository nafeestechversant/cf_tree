<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>User Details</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">                
    </head>
    <body>
        <cfoutput> 
            <div class="event-schedule-area-two bg-color pad100">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title text-center">
                                <div class="title-text">
                                    <h2>Task 4</h2>
                                    <h3>  If we pass 5(Kulathoor) to the function, it should return 4,2,1</h3>
                                </div>
                            </div>
                        </div>
                        <!-- /.col end-->
                    </div>
                    <!-- row end-->
                    <div class="row">
                        <div class="col-lg-12">                       
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade active show" id="home" role="tabpanel">
                                    <div class="table-responsive">
                                         <cfinvoke component="cfc/tree" method="getParentById" returnvariable="ParentValue"> 
                                             <cfinvokeargument  name="locationId" value="5" /> 
                                         </cfinvoke>  
                                        <cfdump  var="#ParentValue#">
<!---                                          <li>#LocName.locationName#</li>  --->
                                        <ul>                                            
                                  
                                        </ul>                                              
                                         
                                    </div>
                                </div>
                            </div>                                                 
                        </div>
                        <!-- /col end-->
                    </div>
                    <!-- /row end-->
                </div>
            </div>
        </cfoutput>     
    </body>
</html>