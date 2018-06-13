defmodule ExAws.ECSTest do
  use ExUnit.Case, async: true
  doctest ExAws.ECS

  test "create_cluster" do
    req = ExAws.ECS.create_cluster("new_cluster")

    assert req.data == %{
             "Action" => "CreateCluster",
             "Version" => "2014-11-13",
             "clusterName" => "new_cluster"
           }

    assert req.headers == expected_headers("CreateCluster")
  end

  test "create_service" do
    req = ExAws.ECS.create_service("new_service", "arn:::task:def", 2)

    assert req.data == %{
             "Action" => "CreateService",
             "Version" => "2014-11-13",
             "serviceName" => "new_service",
             "taskDefinition" => "arn:::task:def",
             "desiredCount" => 2
           }

    assert req.headers == expected_headers("CreateService")
  end

  test "delete_attributes" do
    req = ExAws.ECS.delete_attributes("name=string,value=string")

    assert req.data == %{
             "Action" => "DeleteAttributes",
             "Version" => "2014-11-13",
             "attributes" => "name=string,value=string"
           }

    assert req.headers == expected_headers("DeleteAttributes")
  end

  test "delete_cluster" do
    req = ExAws.ECS.delete_cluster("arn::cluster:id")

    assert req.data == %{
             "Action" => "DeleteCluster",
             "Version" => "2014-11-13",
             "cluster" => "arn::cluster:id"
           }

    assert req.headers == expected_headers("DeleteCluster")
  end

  test "delete_service" do
    req = ExAws.ECS.delete_service("arn::service:id")

    assert req.data == %{
             "Action" => "DeleteService",
             "Version" => "2014-11-13",
             "service" => "arn::service:id"
           }

    assert req.headers == expected_headers("DeleteService")
  end

  test "deregister_container_instance" do
    req = ExAws.ECS.deregister_container_instance("arn::container:id")

    assert req.data == %{
             "Action" => "DeregisterContainerInstance",
             "Version" => "2014-11-13",
             "containerInstance" => "arn::container:id"
           }

    assert req.headers == expected_headers("DeregisterContainerInstance")
  end

  test "deregister_task_definition" do
    req = ExAws.ECS.deregister_task_definition("arn::task:def")

    assert req.data == %{
             "Action" => "DeregisterTaskDefinition",
             "Version" => "2014-11-13",
             "taskDefinition" => "arn::task:def"
           }

    assert req.headers == expected_headers("DeregisterTaskDefinition")
  end

  test "describe_clusters" do
    req = ExAws.ECS.describe_clusters()

    assert req.data == %{
             "Action" => "DescribeClusters",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("DescribeClusters")
  end

  test "describe_container_instances" do
    req = ExAws.ECS.describe_container_instances(["id1", "id2"])

    assert req.data == %{
             "Action" => "DescribeContainerInstances",
             "Version" => "2014-11-13",
             "containerInstances" => ["id1", "id2"]
           }

    assert req.headers == expected_headers("DescribeContainerInstances")
  end

  test "describe_services" do
    req = ExAws.ECS.describe_services(["id1", "id2"])

    assert req.data == %{
             "Action" => "DescribeServices",
             "Version" => "2014-11-13",
             "services" => ["id1", "id2"]
           }

    assert req.headers == expected_headers("DescribeServices")
  end

  test "describe_tasks" do
    req = ExAws.ECS.describe_tasks("cluster", ["id1", "id2"])

    assert req.data == %{
             "Action" => "DescribeTasks",
             "Version" => "2014-11-13",
             "cluster" => "cluster",
             "tasks" => ["id1", "id2"]
           }

    assert req.headers == expected_headers("DescribeTasks")
  end

  test "discover_poll_endpoint" do
    req = ExAws.ECS.discover_poll_endpoint()

    assert req.data == %{
             "Action" => "DiscoverPollEndpoint",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("DiscoverPollEndpoint")
  end

  test "list_attributes" do
    req = ExAws.ECS.list_attributes("target_type_id")

    assert req.data == %{
             "Action" => "ListAttributes",
             "Version" => "2014-11-13",
             "targetType" => "target_type_id"
           }

    assert req.headers == expected_headers("ListAttributes")
  end

  test "list_clusters" do
    req = ExAws.ECS.list_clusters()

    assert req.data == %{
             "Action" => "ListClusters",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("ListClusters")
  end

  test "list_container_instances" do
    req = ExAws.ECS.list_container_instances()

    assert req.data == %{
             "Action" => "ListContainerInstances",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("ListContainerInstances")
  end

  test "list_services" do
    req = ExAws.ECS.list_services()

    assert req.data == %{
             "Action" => "ListServices",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("ListServices")
  end

  test "list_task_definition_families" do
    req = ExAws.ECS.list_task_definition_families()

    assert req.data == %{
             "Action" => "ListTaskDefinitionFamilies",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("ListTaskDefinitionFamilies")
  end

  test "list_task_definitions" do
    req = ExAws.ECS.list_task_definitions()

    assert req.data == %{
             "Action" => "ListTaskDefinitions",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("ListTaskDefinitions")
  end

  test "list_tasks" do
    req = ExAws.ECS.list_tasks("cluster")

    assert req.data == %{
             "Action" => "ListTasks",
             "Version" => "2014-11-13",
             "cluster" => "cluster"
           }

    assert req.headers == expected_headers("ListTasks")
  end

  test "put_attributes" do
    req = ExAws.ECS.put_attributes("name=string,value=string")

    assert req.data == %{
             "Action" => "PutAttributes",
             "Version" => "2014-11-13",
             "attributes" => "name=string,value=string"
           }

    assert req.headers == expected_headers("PutAttributes")
  end

  test "register_container_instances" do
    req = ExAws.ECS.register_container_instance()

    assert req.data == %{
             "Action" => "RegisterContainerInstance",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("RegisterContainerInstance")
  end

  test "register_task_definition" do
    req = ExAws.ECS.register_task_definition("family", ["def1", "def2"])

    assert req.data == %{
             "Action" => "RegisterTaskDefinition",
             "Version" => "2014-11-13",
             "family" => "family",
             "containerDefinitions" => ["def1", "def2"]
           }

    assert req.headers == expected_headers("RegisterTaskDefinition")
  end

  test "run_task" do
    req = ExAws.ECS.run_task("task_def")

    assert req.data == %{
             "Action" => "RunTask",
             "Version" => "2014-11-13",
             "taskDefinition" => "task_def"
           }

    assert req.headers == expected_headers("RunTask")
  end

  test "start_task" do
    req = ExAws.ECS.start_task("task_def", ["cinst1", "cinst2"])

    assert req.data == %{
             "Action" => "StartTask",
             "Version" => "2014-11-13",
             "taskDefinition" => "task_def",
             "containerInstances" => ["cinst1", "cinst2"]
           }

    assert req.headers == expected_headers("StartTask")
  end

  test "stop_task" do
    req = ExAws.ECS.stop_task("task_id")

    assert req.data == %{
             "Action" => "StopTask",
             "Version" => "2014-11-13",
             "task" => "task_id"
           }

    assert req.headers == expected_headers("StopTask")
  end

  test "submit_container_state_change" do
    req = ExAws.ECS.submit_container_state_change()

    assert req.data == %{
             "Action" => "SubmitContainerStateChange",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("SubmitContainerStateChange")
  end

  test "submit_task_state_change" do
    req = ExAws.ECS.submit_task_state_change()

    assert req.data == %{
             "Action" => "SubmitTaskStateChange",
             "Version" => "2014-11-13"
           }

    assert req.headers == expected_headers("SubmitTaskStateChange")
  end

  test "update_container_agent" do
    req = ExAws.ECS.update_container_agent("cinst1")

    assert req.data == %{
             "Action" => "UpdateContainerAgent",
             "Version" => "2014-11-13",
             "containerInstance" => "cinst1"
           }

    assert req.headers == expected_headers("UpdateContainerAgent")
  end

  test "update_container_instances_state" do
    req = ExAws.ECS.update_container_instances_state(["cinst1", "cinst2"], "STOPPED")

    assert req.data == %{
             "Action" => "UpdateContainerInstancesState",
             "Version" => "2014-11-13",
             "containerInstances" => ["cinst1", "cinst2"],
             "status" => "STOPPED"
           }

    assert req.headers == expected_headers("UpdateContainerInstancesState")
  end

  test "update_service" do
    req = ExAws.ECS.update_service("service_id", desired_count: 4)

    assert req.data == %{
             "Action" => "UpdateService",
             "Version" => "2014-11-13",
             "service" => "service_id",
             "desiredCount" => 4
           }

    assert req.headers == expected_headers("UpdateService")
  end

  defp expected_headers(action) do
    [
      {"x-amz-target", "AmazonEC2ContainerServiceV20141113.#{action}"},
      {"content-type", "application/x-amz-json-1.1"}
    ]
  end
end
