# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: google/spanner/admin/instance/v1/spanner_instance_admin.proto for package 'Google::Cloud::Spanner::Admin::Instance::V1'
# Original file comments:
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


require 'grpc'
require 'google/spanner/admin/instance/v1/spanner_instance_admin_pb'

module Google
  module Spanner
    module Admin
      module Instance
      end
    end
  end
end
module Google::Spanner::Admin::Instance::V1
  module InstanceAdmin
    # Cloud Spanner Instance Admin API
    #
    # The Cloud Spanner Instance Admin API can be used to create, delete,
    # modify and list instances. Instances are dedicated Cloud Spanner serving
    # and storage resources to be used by Cloud Spanner databases.
    #
    # Each instance has a "configuration", which dictates where the
    # serving resources for the Cloud Spanner instance are located (e.g.,
    # US-central, Europe). Configurations are created by Google based on
    # resource availability.
    #
    # Cloud Spanner billing is based on the instances that exist and their
    # sizes. After an instance exists, there are no additional
    # per-database or per-operation charges for use of the instance
    # (though there may be additional network bandwidth charges).
    # Instances offer isolation: problems with databases in one instance
    # will not affect other instances. However, within an instance
    # databases can affect each other. For example, if one database in an
    # instance receives a lot of requests and consumes most of the
    # instance resources, fewer resources are available for other
    # databases in that instance, and their performance may suffer.
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'google.spanner.admin.instance.v1.InstanceAdmin'

      # Lists the supported instance configurations for a given project.
      rpc :ListInstanceConfigs, ListInstanceConfigsRequest, ListInstanceConfigsResponse
      # Gets information about a particular instance configuration.
      rpc :GetInstanceConfig, GetInstanceConfigRequest, InstanceConfig
      # Lists all instances in the given project.
      rpc :ListInstances, ListInstancesRequest, ListInstancesResponse
      # Gets information about a particular instance.
      rpc :GetInstance, GetInstanceRequest, Instance
      # Creates an instance and begins preparing it to begin serving. The
      # returned [long-running operation][google.longrunning.Operation]
      # can be used to track the progress of preparing the new
      # instance. The instance name is assigned by the caller. If the
      # named instance already exists, `CreateInstance` returns
      # `ALREADY_EXISTS`.
      #
      # Immediately upon completion of this request:
      #
      #   * The instance is readable via the API, with all requested attributes
      #     but no allocated resources. Its state is `CREATING`.
      #
      # Until completion of the returned operation:
      #
      #   * Cancelling the operation renders the instance immediately unreadable
      #     via the API.
      #   * The instance can be deleted.
      #   * All other attempts to modify the instance are rejected.
      #
      # Upon completion of the returned operation:
      #
      #   * Billing for all successfully-allocated resources begins (some types
      #     may have lower than the requested levels).
      #   * Databases can be created in the instance.
      #   * The instance's allocated resource levels are readable via the API.
      #   * The instance's state becomes `READY`.
      #
      # The returned [long-running operation][google.longrunning.Operation] will
      # have a name of the format `<instance_name>/operations/<operation_id>` and
      # can be used to track creation of the instance.  The
      # [metadata][google.longrunning.Operation.metadata] field type is
      # [CreateInstanceMetadata][google.spanner.admin.instance.v1.CreateInstanceMetadata].
      # The [response][google.longrunning.Operation.response] field type is
      # [Instance][google.spanner.admin.instance.v1.Instance], if successful.
      rpc :CreateInstance, CreateInstanceRequest, Google::Longrunning::Operation
      # Updates an instance, and begins allocating or releasing resources
      # as requested. The returned [long-running
      # operation][google.longrunning.Operation] can be used to track the
      # progress of updating the instance. If the named instance does not
      # exist, returns `NOT_FOUND`.
      #
      # Immediately upon completion of this request:
      #
      #   * For resource types for which a decrease in the instance's allocation
      #     has been requested, billing is based on the newly-requested level.
      #
      # Until completion of the returned operation:
      #
      #   * Cancelling the operation sets its metadata's
      #     [cancel_time][google.spanner.admin.instance.v1.UpdateInstanceMetadata.cancel_time], and begins
      #     restoring resources to their pre-request values. The operation
      #     is guaranteed to succeed at undoing all resource changes,
      #     after which point it terminates with a `CANCELLED` status.
      #   * All other attempts to modify the instance are rejected.
      #   * Reading the instance via the API continues to give the pre-request
      #     resource levels.
      #
      # Upon completion of the returned operation:
      #
      #   * Billing begins for all successfully-allocated resources (some types
      #     may have lower than the requested levels).
      #   * All newly-reserved resources are available for serving the instance's
      #     tables.
      #   * The instance's new resource levels are readable via the API.
      #
      # The returned [long-running operation][google.longrunning.Operation] will
      # have a name of the format `<instance_name>/operations/<operation_id>` and
      # can be used to track the instance modification.  The
      # [metadata][google.longrunning.Operation.metadata] field type is
      # [UpdateInstanceMetadata][google.spanner.admin.instance.v1.UpdateInstanceMetadata].
      # The [response][google.longrunning.Operation.response] field type is
      # [Instance][google.spanner.admin.instance.v1.Instance], if successful.
      #
      # Authorization requires `spanner.instances.update` permission on
      # resource [name][google.spanner.admin.instance.v1.Instance.name].
      rpc :UpdateInstance, UpdateInstanceRequest, Google::Longrunning::Operation
      # Deletes an instance.
      #
      # Immediately upon completion of the request:
      #
      #   * Billing ceases for all of the instance's reserved resources.
      #
      # Soon afterward:
      #
      #   * The instance and *all of its databases* immediately and
      #     irrevocably disappear from the API. All data in the databases
      #     is permanently deleted.
      rpc :DeleteInstance, DeleteInstanceRequest, Google::Protobuf::Empty
      # Sets the access control policy on an instance resource. Replaces any
      # existing policy.
      #
      # Authorization requires `spanner.instances.setIamPolicy` on
      # [resource][google.iam.v1.SetIamPolicyRequest.resource].
      rpc :SetIamPolicy, Google::Iam::V1::SetIamPolicyRequest, Google::Iam::V1::Policy
      # Gets the access control policy for an instance resource. Returns an empty
      # policy if an instance exists but does not have a policy set.
      #
      # Authorization requires `spanner.instances.getIamPolicy` on
      # [resource][google.iam.v1.GetIamPolicyRequest.resource].
      rpc :GetIamPolicy, Google::Iam::V1::GetIamPolicyRequest, Google::Iam::V1::Policy
      # Returns permissions that the caller has on the specified instance resource.
      #
      # Attempting this RPC on a non-existent Cloud Spanner instance resource will
      # result in a NOT_FOUND error if the user has `spanner.instances.list`
      # permission on the containing Google Cloud Project. Otherwise returns an
      # empty set of permissions.
      rpc :TestIamPermissions, Google::Iam::V1::TestIamPermissionsRequest, Google::Iam::V1::TestIamPermissionsResponse
    end

    Stub = Service.rpc_stub_class
  end
end
