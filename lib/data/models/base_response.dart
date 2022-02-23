enum ResponseStatus { success, error }

class BaseResponse<T, E> {
  const BaseResponse({
    this.data,
    this.responseStatus,
    this.error,
  });

  BaseResponse.success(T? data)
      : this(responseStatus: ResponseStatus.success, data: data);

  BaseResponse.error(E? error)
      : this(responseStatus: ResponseStatus.error, error: error);

  final ResponseStatus? responseStatus;
  final T? data;
  final E? error;
}
