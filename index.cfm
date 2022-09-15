<cfinvoke component="cfc/tree" method="getTreeLists" returnvariable="TreeLists"></cfinvoke>
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
                                    <h2>Location</h2>
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
                                        <cfinvoke component="cfc/tree" method="getLocNameById" returnvariable="LocName">
                                            <cfinvokeargument  name="locationId" value="#TreeLists.locationId#" />
                                        </cfinvoke> 
                                         <li>#LocName.locationName#</li> 
                                        <ul>                                            
                                            <cfloop query="TreeLists">
                                                <cfset getNodeBylocationId(TreeLists.locationId) />
                                                <cfset getNodeBylocationId(3) />
<!---                                                  <cfinvoke component="cfc/tree" method="getNodeBylocationId" returnvariable="NodeBylocationId"> --->
<!---                                                     <cfinvokeargument  name="locationId" value="#TreeLists.locationId#" /> --->
<!---                                                 </cfinvoke> --->   
                                           </cfloop>
                                        </ul>                                                
                                                        <cffunction name="getNodeBylocationId" output="true">
                                                            <cfargument name="locationId" type="any" />
                                                            <cfif ARGUMENTS.locationId neq "">
                                                                <cfquery name = "qry.FindChildren" result="r">
                                                                    SELECT locationId,locationName FROM locations WHERE parentLocationId = #ARGUMENTS.locationId#
                                                                </cfquery>
                                                            </cfif>
        <!---                                                     <cfoutput>SQL: #r.SQL#</cfoutput> --->
                                                            <cfif qry.FindChildren.recordcount>
                                                                <li>
                                                                    <ul>#qry.FindChildren.locationName#
                                                                        <cfloop query="qry.FindChildren">                                                                                   
                                                                             <cfset getNodeBylocationId(qry.FindChildren.locationId) /> 
                                                                        </cfloop>
                                                                    </ul>
                                                                </li>
                                                            <cfelse>
<!---                                                                   <li>#qry.FindChildren.locationId#<li>   --->
                                                            </cfif>
                                                        </cffunction>                                                
                                         
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