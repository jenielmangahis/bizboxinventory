@extends('layouts.backend.master')

@section('header-php')
  <?php
  $body_id = '';
  $body_class = '';
  ?>
@endsection 

@section('meta-dynamic')
  <title>{{ config('app.name') }}</title>  
  <meta name="description" content="-">    
@endsection

@section('main')
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Inventory Management
    </h1>
    
    <!-- 
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
      <li class="active">Here</li>
    </ol> 
    -->

  </section>

  <!-- Main content -->
    <section class="content container-fluid">

        <!--------------------------
          | Your Page Content Here |
          -------------------------->

        @if(Session::has('message'))
            <div class="alert {{ Session::get('alert_class') }}">
              <button type="button" class="close" data-dismiss="alert">&times</button>
              {{ Session::get('message') }}
            </div>
        @endif    
        
        <div class="row">
            <div class="col-md-12">
              <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Inventory List</h3>
                    <div class="pull-right">
                        <a href="{{route('inventory/create')}}" class="btn btn-primary">
                            <i class="fa fa-plus"></i> Create New
                        </a>
                    </div>
                </div>
                <!-- /.box-header -->

                <div class="box-body">

                  <table class="table table-bordered table-hover">
                    <tr>
                      <th style="width: 1%;" >#</th>
                      <th style="width: 70%;">Item Name</th>
                      <th>Date</th>
                      <th>In</th>
                      <th>Out</th>
                      <th>Previous Stock</th>
                      <th>New Stock</th>
                    </tr>
                    @foreach($inventory as $i)
                        <tr>
                            <td>{{ $i->id }}</td>
                            <td>{{ $i->item->item_name }}</td>
                            <td>{{ $i->inventory_date }}</td>
                            <td>{{ number_format($i->in, 0) }}</td>
                            <td>{{ number_format($i->out, 0) }}</td>
                            <td>{{ number_format($i->previous_stock, 0) }}</td>
                            <td>{{ number_format($i->new_stock, 0) }}</td>
                        </tr>

                        <div id="modalDelete-<?= $i->id; ?>" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" style="text-align: left">
                            <div class="modal-dialog modal-md">
                              <div class="modal-content">

                                <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                  </button>
                                  <h4 class="modal-title" id="myModalLabel">Delete</h4>
                                </div>
                                <div class="modal-body">
                                  Are you sure you want to delete selected inventory date?
                                </div>
                                <div class="modal-footer">
                                  {{ Form::open(array('url' => 'inventory/destroy')) }}
                                    <?php echo Form::hidden('id', Hashids::encode($i->id) ,[]); ?>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                    <button type="submit" class="btn btn-danger">Yes</button>
                                  {!! Form::close() !!}
                                </div>

                              </div>
                            </div>
                        </div>   

                    @endforeach
                  </table>

                </div>
                <!-- /.box-body -->

                <div style="text-align: center;" class="box-footer clearfix">
                    {{ $inventory->links() }}
                </div>

              </div>
              <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

    </section>
  <!-- /.content -->
@endsection

