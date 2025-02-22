%{--
  - Copyright 2016 SimplifyOps, Inc. (http://simplifyops.com)
  -
  - Licensed under the Apache License, Version 2.0 (the "License");
  - you may not use this file except in compliance with the License.
  - You may obtain a copy of the License at
  -
  -     http://www.apache.org/licenses/LICENSE-2.0
  -
  - Unless required by applicable law or agreed to in writing, software
  - distributed under the License is distributed on an "AS IS" BASIS,
  - WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  - See the License for the specific language governing permissions and
  - limitations under the License.
  --}%

<span class="help-block">
    <g:message code="scm.${integration}.plugins.help"/>
</span>
<g:set var="serviceName" value="${integration=='export'?'ScmExport':'ScmImport'}"/>

<g:if test="${pluginConfig && pluginConfig.type && enabled && configuredPlugin && enabled}">
%{--Disable plugin modal--}%
    <g:form class="modal-container" useToken="true">
        <div class="modal fade" id="disablePlugin${integration}" role="dialog" aria-labelledby="disablePlugin${integration}ModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="disablePlugin${integration}ModalLabel">
                            <g:message code="scmController.action.disable.${integration}.confirm.title"/>
                        </h4>
                    </div>

                    <div class="modal-body container">
                        <div class="form-group">
                            <label class="control-label col-sm-2">
                                <g:message code="plugin"/>:
                            </label>

                            <div class="col-sm-10">
                                <span class="form-control-static">
                                    <stepplugin:message
                                            service="${serviceName}"
                                            name="${configuredPlugin?.description.name}"
                                            code="plugin.title"
                                            default="${configuredPlugin?.description.title?:configuredPlugin?.description.name}"/>
                                </span>
                                <g:hiddenField name="type" value="${pluginConfig.type}"/>
                                <g:hiddenField name="project" value="${params.project}"/>
                                <g:hiddenField name="integration" value="${integration}"/>
                            </div>
                        </div>

                    </div>

                    <div class="modal-body">
                        <span class="text-danger"><g:message code="plugin.disable.confirm.text"/></span>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <g:message code="no"/>
                        </button>
                        <g:actionSubmit action="disable" value="${message(code: 'yes')}" formmethod="POST"
                                        class="btn btn-danger"/>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </g:form>
</g:if>
<g:if test="${pluginConfig && pluginConfig.type && !enabled && configuredPlugin}">
%{--Enable plugin modal--}%
    <g:form class="modal-container" useToken="true">
        <div class="modal fade" id="enablePlugin${integration}" role="dialog" aria-labelledby="enablePlugin${integration}ModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="enablePlugin${integration}ModalLabel">
                            <g:message code="scmController.action.enable.${integration}.confirm.title"/>
                        </h4>
                    </div>

                    <div class="modal-body container">
                        <div class="form-group">
                            <label class="control-label col-sm-2">
                                <g:message code="plugin"/>:
                            </label>

                            <div class="col-sm-10">
                                <span class="form-control-static">
                                    <stepplugin:message
                                            service="${serviceName}"
                                            name="${configuredPlugin?.description.name}"
                                            code="plugin.title"
                                            default="${configuredPlugin?.description.title?:configuredPlugin?.description.name}"/>
                                </span>
                                <g:hiddenField name="type" value="${pluginConfig.type}"/>
                                <g:hiddenField name="project" value="${params.project}"/>
                                <g:hiddenField name="integration" value="${integration}"/>
                            </div>
                        </div>

                    </div>

                    <div class="modal-body">
                        <span class="text-danger"><g:message code="plugin.enable.confirm.text"/></span>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <g:message code="no"/>
                        </button>
                        <g:actionSubmit action="enable" value="${message(code: 'yes')}" formmethod="POST"
                                        class="btn btn-success"/>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </g:form>

<g:form class="modal-container" useToken="true">
    <div class="modal fade" id="cleanPlugin${integration}" role="dialog" aria-labelledby="cleanPlugin${integration}ModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="cleanPlugin${integration}ModalLabel">
                        <g:message code="scmController.action.clean.${integration}.confirm.title" default="scmController.action.clean.${integration}.confirm.title"/>
                    </h4>
                </div>

                <div class="modal-body container">
                    <div class="form-group">
                        <label class="control-label col-sm-2">
                            <g:message code="plugin"/>:
                        </label>

                        <div class="col-sm-10">
                            <span class="form-control-static">
                                <stepplugin:message
                                        service="${serviceName}"
                                        name="${configuredPlugin?.description.name}"
                                        code="plugin.title"
                                        default="${configuredPlugin?.description.title?:configuredPlugin?.description.name}"/>
                            </span>
                            <g:hiddenField name="type" value="${pluginConfig.type}"/>
                            <g:hiddenField name="project" value="${params.project}"/>
                            <g:hiddenField name="integration" value="${integration}"/>
                        </div>
                    </div>

                </div>

                <div class="modal-body">
                    <span class="text-danger"><g:message code="plugin.clean.confirm.text"/></span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        <g:message code="no"/>
                    </button>
                    <g:actionSubmit action="clean" value="${message(code: 'yes')}" formmethod="POST"
                                    class="btn btn-danger"/>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</g:form>
    <g:form class="modal-container" useToken="true">
        <div class="modal fade" id="deletePlugin${integration}" role="dialog" aria-labelledby="deletePlugin${integration}ModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="deletePlugin${integration}ModalLabel">
                            <g:message code="scmController.action.delete.${integration}.confirm.title" default="scmController.action.delete.${integration}.confirm.title"/>
                        </h4>
                    </div>

                    <div class="modal-body container">
                        <div class="form-group">
                            <label class="control-label col-sm-2">
                                <g:message code="plugin"/>:
                            </label>

                            <div class="col-sm-10">
                                <span class="form-control-static">
                                    <stepplugin:message
                                            service="${serviceName}"
                                            name="${configuredPlugin?.description.name}"
                                            code="plugin.title"
                                            default="${configuredPlugin?.description.title?:configuredPlugin?.description.name}"/>
                                </span>
                                <g:hiddenField name="type" value="${pluginConfig.type}"/>
                                <g:hiddenField name="project" value="${params.project}"/>
                                <g:hiddenField name="integration" value="${integration}"/>
                            </div>
                        </div>

                    </div>

                    <div class="modal-body">
                        <span class="text-danger"><g:message code="plugin.delete.confirm.text"/></span>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            <g:message code="no"/>
                        </button>
                        <g:actionSubmit action="deletePluginConfig" value="${message(code: 'yes')}" formmethod="POST"
                                        class="btn btn-danger"/>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </g:form>
    </g:if>

<g:if test="${plugins}">
  <div class="list-group">
  <g:each in="${plugins.keySet().sort()}" var="pluginName">
    <g:set var="isConfigured" value="${pluginConfig && pluginConfig.type == pluginName}"/>
    <g:set var="isConfiguredButDisabled" value="${isConfigured && !enabled}"/>
    <g:set var="isConfiguredAndEnabled" value="${isConfigured && enabled}"/>
    <div class="list-group-item">
      <h4 class="list-group-item-heading">
        <stepplugin:pluginIcon service="${serviceName}"
                               name="${pluginName}"
                               width="24px"
                               height="24px"
        />
        <stepplugin:message service="${serviceName}"
                            name="${pluginName}"
                            code="plugin.title"
                            default="${plugins[pluginName].description.title?:pluginName}"
        />
        <g:if test="${isConfiguredButDisabled}">
          <span class="badge"><g:message code="badge.Disabled.title"/></span>
        </g:if>

        <g:if test="${isConfiguredAndEnabled}">
          <span class="badge badge-success">
            <g:icon name="check"/>
            <g:message code="badge.Enabled.title"/>
          </span>
        </g:if>
      </h4>
      <div class="list-group-item-text">
        <g:render template="/framework/renderPluginConfig"
                  model="${[
                          serviceName:serviceName,
                          values     : isConfigured ? pluginConfig.config : [:],
                          description: plugins[pluginName].description,
                          messagePrefix:'setup.',
                          hideTitle  : true
                  ]}"/>
        <g:if test="${isConfiguredButDisabled}">
          <span class="btn  btn-success"
                data-toggle="modal"
                data-target="#enablePlugin${integration}"
                style="margin-top:1em;">
            <g:message code="button.Enable.title"/>
          </span>
        </g:if>
        <g:elseif test="${isConfiguredAndEnabled}">
          <span class="btn btn-warning"
                data-toggle="modal"
                data-target="#disablePlugin${integration}"
                style="margin-top:1em;">
            <g:message code="button.Disable.title"/>
          </span>
        </g:elseif>
        <g:if test="${!isConfiguredAndEnabled}">
          <g:link action="setup"
                  class="btn  ${isConfiguredButDisabled ? 'btn-default' : 'btn-success'}"
                  params="[type: plugins[pluginName].name, project: params.project,integration:integration]"
                  style="margin-top:1em;">
            <g:icon name="cog"/>
            <g:if test="${isConfigured}">
                <g:message code="button.Configure.title"/>
            </g:if>
            <g:else>
                <g:message code="button.Setup.title"/>
            </g:else>
          </g:link>
        </g:if>
        <g:if test="${isConfiguredButDisabled}">
          <span class="btn btn-warning"
                data-toggle="modal"
                data-target="#cleanPlugin${integration}"
                style="margin-top:1em;">
            <g:message code="button.Clean.title"/>
          </span>
        </g:if>
        <g:if test="${isConfiguredButDisabled}">
          <span class="btn btn-danger"
                data-toggle="modal"
                data-target="#deletePlugin${integration}"
                style="margin-top:1em;">
              <g:message code="button.Delete.title"/>
          </span>
        </g:if>
      </div>
    </div>
  </g:each>
  </div>
</g:if>
