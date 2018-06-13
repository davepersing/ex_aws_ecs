defmodule ExAws.ECS do
  @moduledoc """
  AWS ECS Service for ExAws
  """

  alias ExAws.Operation.JSON

  import ExAws.Utils, only: [camelize_keys: 1]

  @version "2014-11-13"
  @namespace "AmazonEC2ContainerServiceV20141113"

  def create_cluster(cluster_name) do
    request(%{
      "Action" => "CreateCluster",
      "clusterName" => cluster_name
    })
  end

  def create_service(service_name, task_definition, desired_count, opts \\ []) do
    %{
      "Action" => "CreateService",
      "serviceName" => service_name,
      "taskDefinition" => task_definition,
      "desiredCount" => desired_count
    }
    |> merge_opts(opts)
    |> request()
  end

  def delete_attributes(attributes, opts \\ []) do
    %{
      "Action" => "DeleteAttributes",
      "attributes" => attributes
    }
    |> merge_opts(opts)
    |> request()
  end

  def delete_cluster(cluster) do
    request(%{
      "Action" => "DeleteCluster",
      "cluster" => cluster
    })
  end

  def delete_service(service) do
    request(%{
      "Action" => "DeleteService",
      "service" => service
    })
  end

  def deregister_container_instance(container_instance, opts \\ []) do
    %{
      "Action" => "DeregisterContainerInstance",
      "containerInstance" => container_instance
    }
    |> merge_opts(opts)
    |> request()
  end

  def deregister_task_definition(task_definition) do
    request(%{
      "Action" => "DeregisterTaskDefinition",
      "taskDefinition" => task_definition
    })
  end

  def describe_clusters do
    request(%{"Action" => "DescribeClusters"})
  end

  def describe_container_instances(container_instances) do
    request(%{
      "Action" => "DescribeContainerInstances",
      "containerInstances" => container_instances
    })
  end

  def describe_services(services, opts \\ []) do
    %{
      "Action" => "DescribeServices",
      "services" => services
    }
    |> merge_opts(opts)
    |> request()
  end

  def describe_task_definition(task_definition) do
    request(%{
      "Action" => "DescribeTaskDefinition",
      "taskDefinition" => task_definition
    })
  end

  def describe_tasks(cluster, tasks, opts \\ []) do
    %{
      "Action" => "DescribeTasks",
      "cluster" => cluster,
      "tasks" => tasks
    }
    |> merge_opts(opts)
    |> request()
  end

  def discover_poll_endpoint(opts \\ []) do
    %{
      "Action" => "DiscoverPollEndpoint"
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_attributes(target_type, opts \\ []) do
    %{
      "Action" => "ListAttributes",
      "targetType" => target_type
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_clusters(opts \\ []) do
    %{
      "Action" => "ListClusters"
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_container_instances(opts \\ []) do
    %{
      "Action" => "ListContainerInstances"
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_services(opts \\ []) do
    %{
      "Action" => "ListServices"
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_task_definition_families(opts \\ []) do
    %{
      "Action" => "ListTaskDefinitionFamilies"
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_task_definitions(opts \\ []) do
    %{
      "Action" => "ListTaskDefinitions"
    }
    |> merge_opts(opts)
    |> request()
  end

  def list_tasks(cluster, opts \\ []) do
    %{
      "Action" => "ListTasks",
      "Version" => @version,
      "cluster" => cluster
    }
    |> merge_opts(opts)
    |> request()
  end

  def put_attributes(attributes, opts \\ []) do
    %{
      "Action" => "PutAttributes",
      "attributes" => attributes
    }
    |> merge_opts(opts)
    |> request()
  end

  def register_container_instance(opts \\ []) do
    %{
      "Action" => "RegisterContainerInstance"
    }
    |> merge_opts(opts)
    |> request()
  end

  def register_task_definition(family, container_definitions, opts \\ []) do
    %{
      "Action" => "RegisterTaskDefinition",
      "family" => family,
      "containerDefinitions" => container_definitions
    }
    |> merge_opts(opts)
    |> request()
  end

  def run_task(task_definition, opts \\ []) do
    %{
      "Action" => "RunTask",
      "taskDefinition" => task_definition
    }
    |> merge_opts(opts)
    |> request()
  end

  def start_task(task_definition, container_instances, opts \\ []) do
    %{
      "Action" => "StartTask",
      "taskDefinition" => task_definition,
      "containerInstances" => container_instances
    }
    |> merge_opts(opts)
    |> request()
  end

  def stop_task(task, opts \\ []) do
    %{
      "Action" => "StopTask",
      "task" => task
    }
    |> merge_opts(opts)
    |> request()
  end

  def submit_container_state_change(opts \\ []) do
    %{
      "Action" => "SubmitContainerStateChange"
    }
    |> merge_opts(opts)
    |> request()
  end

  def submit_task_state_change(opts \\ []) do
    %{
      "Action" => "SubmitTaskStateChange"
    }
    |> merge_opts(opts)
    |> request()
  end

  def update_container_agent(container_instance, opts \\ []) do
    %{
      "Action" => "UpdateContainerAgent",
      "containerInstance" => container_instance
    }
    |> merge_opts(opts)
    |> request()
  end

  def update_container_instances_state(container_instances, status, opts \\ []) do
    %{
      "Action" => "UpdateContainerInstancesState",
      "containerInstances" => container_instances,
      "status" => status
    }
    |> merge_opts(opts)
    |> request()
  end

  def update_service(service, opts \\ []) do
    %{
      "Action" => "UpdateService",
      "service" => service
    }
    |> merge_opts(opts)
    |> request()
  end

  defp merge_opts(params, opts) do
    opts
    |> normalize_opts()
    |> Map.merge(params)
  end

  defp request(%{"Action" => action} = params, opts \\ %{}) do
    params = Map.merge(params, %{"Version" => @version})

    JSON.new(
      :ecs,
      %{
        data: params,
        headers: [
          {"x-amz-target", "#{@namespace}.#{action}"},
          {"content-type", "application/x-amz-json-1.1"}
        ]
      }
      |> Map.merge(opts)
    )
  end

  # This JSON API requires lower camelCased parameters.
  defp normalize_opts(opts) do
    opts
    |> Enum.into(%{})
    |> camelize_keys()
    |> Enum.reduce(
      %{},
      fn {k, v}, acc ->
        Map.put(acc, to_lower_camel_case(k), v)
      end
    )
  end

  defp to_lower_camel_case(string) do
    {first, rest} = String.split_at(string, 1)

    String.downcase(first) <> rest
  end
end
