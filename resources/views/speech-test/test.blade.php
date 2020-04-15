@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h3>
                    <a href="https://dev.to/asaoluelijah/speech-recognition-with-javascript-4lh6" target="_blank">Speech Recognition With Javascript</a>
                </h3>
                <p id="color-list">Say color from list to change background: </p>
                <hr>
                <button type="button" class="btn btn-secondary" id="start-recording">Start</button>
                <button type="button" class="btn btn-secondary" id="stop-recording" disabled>Stop</button>
                <div class="mt-2">
                    <textarea class="form-control" rows="4" id="output"></textarea>
                </div>
                <div class="mt-2" id="result-list"></div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="{{ mix('js/speech-test.js', 'build') }}"></script>
@endpush
