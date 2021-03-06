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
      Item | Edit
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

          {{ Form::open(array('url' => 'item/update', 'class' => '')) }}
          <input type="hidden" name="id" value="<?= Hashids::encode($item->id); ?>">                
            <div class="box-body">
              <div class="form-group">
                <label>Category <span class="required">*</span></label>
                <select name="item_category_id" class="form-control">
                  @foreach($itemCategories as $ic)
                    <option <?php echo $item->item_category_id == $ic->id ? 'selected="selected"' : ''; ?> value="{{$ic->id}}">{{ $ic->item_category_name }}</option>
                  @endforeach
                </select>
              </div>

              <div class="form-group">
                <label>Item Name <span class="required">*</span></label>
                <?php echo Form::text('item_name', $item->item_name ,['class' => 'form-control', 'required' => '']); ?>
              </div>

              <div class="form-group">
                <label>Item Description <span class="required">*</span></label>
                <?php echo Form::textarea('item_description', $item->item_description ,['class' => 'form-control', 'required' => '']); ?>
              </div> 

              <div class="form-group">
                <label>Current Stock <span class="required">*</span></label>
                <?php echo Form::number('stock', $item->stock ,['class' => 'form-control', 'required' => '']); ?>
              </div>   

              <div class="form-group">
                <label>Price <span class="required">*</span></label>
                <?php echo Form::number('price', number_format($item->price,2) ,['class' => 'form-control', 'required' => '']); ?>
              </div>     
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-success">Submit</button>
              <a class="btn btn-primary" href="{{route('item')}}">Cancel</a>
            </div>
          {!! Form::close() !!}     

        </div>        

    </section>
  <!-- /.content -->
@endsection

