This is an about page!

<?php echo $name_Geza; ?>

@extends('/templates/layout')

@section('title', 'Page About')

@section('sidebar')
    @parent
    <p>This is appended to the master sidebar.</p>
@endsection

@section('content')
    <p>This is the body content: This is an about page,
        Hi, my name is {{$name_Geza}}.</p>
@endsection
