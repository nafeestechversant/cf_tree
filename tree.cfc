<cfcomponent>                
     <cffunction name="getTreeLists" access="public" output="false" returntype="query">		
		<cfquery name="qry.rs_getTreeLists">
            SELECT locationId FROM locations WHERE parentLocationId is null;			
		</cfquery>		
		<cfreturn qry.rs_getTreeLists />
	</cffunction> 
    <cffunction name="getLocNameById" access="public" output="false" returntype="query">
        <cfargument name="locationId" type="integer" required="true" />			
		<cfquery name="qry.rs_getTreeLists">
            SELECT locationName FROM locations WHERE locationId= <cfqueryparam value="#arguments.locationId#" cfsqltype="cf_sql_integer" />;			
		</cfquery>		
		<cfreturn qry.rs_getTreeLists />
	</cffunction> 
	<cffunction name="getLocDepthById" access="public" output="false" returntype="any">
        <cfargument name="locationId" type="integer" required="true" />			
		<cfquery name="qry.rs_getLocDepthById"  result="r">
			SELECT @r AS loc_id, (SELECT @r := `parentLocationId` FROM `locations` WHERE `locationId` = loc_id) AS parent_id, @l := @l + 1 AS LEVEL FROM (SELECT @r :=<cfqueryparam value="#arguments.locationId#" cfsqltype="cf_sql_integer" /> , @l := 0) val, locations WHERE @r <> 0;            
		</cfquery>					
  		<cfreturn qry.rs_getLocDepthById.recordcount />  
	</cffunction> 

	<cffunction name="getParentById" access="public" output="false" returntype="any">
        <cfargument name="locationId" type="integer" required="true" />			
		<cfquery name="qry.rs_getParentById"  result="r">
			SELECT @r AS loc_id, (SELECT @r := `parentLocationId` FROM `locations` WHERE `locationId` = loc_id) AS parent_id, @l := @l + 1 AS LEVEL FROM (SELECT @r :=<cfqueryparam value="#arguments.locationId#" cfsqltype="cf_sql_integer" /> , @l := 0) val, locations WHERE @r <> 0;            
		</cfquery>	
		<cfset local.myList = ValueList(qry.rs_getParentById.parent_id)>				
  		<cfreturn local.myList />  
	</cffunction>

	<cffunction name="getChildById" access="public" output="false" returntype="any">
        <cfargument name="locationId" type="integer" required="true" />			
		<cfquery name="qry.rs_getChildById"  result="r">
			SELECT @r AS loc_id, (SELECT @r := `locationId` FROM `locations` WHERE `parentLocationId` = loc_id) AS child_id, @l := @l + 1 AS LEVEL FROM (SELECT @r :=<cfqueryparam value="#arguments.locationId#" cfsqltype="cf_sql_integer" /> , @l := 0) val, locations WHERE @r <> 0;            
		</cfquery>	
		<cfset local.myList = ValueList(qry.rs_getChildById.child_id)>				
  		<cfreturn local.myList />  
	</cffunction>


      
</cfcomponent>