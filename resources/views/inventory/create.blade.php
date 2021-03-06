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
      Inventory | Create
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

        @if ($errors->any())
            <div class="alert alert-danger">
                <button type="button" class="close" data-dismiss="alert">&times</button>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif         
        
        <div class="box box-primary">

          {{ Form::open(array('url' => 'inventory/store', 'class' => '')) }}
            <div class="box-body">
              
              <div class="form-group">
                <label>Item Category <span class="required">*</span></label>
                <select name="item_id" class="form-control">
                  @foreach($items as $i)
                    <option value="{{$i->id}}">{{ $i->item_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="form-group">
                <label>Inventory Date <span class="required">*</span></label>
                <?php echo Form::text('inventory_date', date("Y-m-d") ,['class' => 'form-control inventory-date', 'required' => '']); ?>
              </div>
              <div class="form-group">
                <label>In Quantity <span class="required">*</span></label>
                <?php echo Form::number('in', 0 ,['class' => 'form-control', 'required' => '']); ?>
              </div>   

              <div class="form-group">
                <label>Out Quantity <span class="required">*</span></label>
                <?php echo Form::number('out', 0 ,['class' => 'form-control', 'required' => '']); ?>
              </div>          
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-success">Submit</button>
              <a class="btn btn-primary" href="{{route('inventory')}}">Cancel</a>
            </div>
          {!! Form::close() !!}     

        </div>        

    </section>
  <!-- /.content -->
@endsection

@section('page-footer-scripts')
<script>
  var base_url = '<?php echo url("/"); ?>'; 
  $(function(){
    $('.inventory-date').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd',
    });
  });
</script>
@endsection
