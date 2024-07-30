const std = @import("std");
const bun = @import("root").bun;
const Environment = bun.Environment;
const JSC = bun.JSC;
const string = bun.string;
const Output = bun.Output;
const ZigString = JSC.ZigString;
const uv = bun.windows.libuv;

pub fn internalErrorName(globalThis: *JSC.JSGlobalObject, callframe: *JSC.CallFrame) callconv(JSC.conv) JSC.JSValue {
    const arguments = callframe.arguments(1).slice();
    if (arguments.len < 1) {
        globalThis.throwNotEnoughArguments("internalErrorName", 1, arguments.len);
        return .zero;
    }

    const err_value = arguments[0];
    const err_int = err_value.toInt32();

    if (err_int == -4095) return ZigString.static("EOF").toJS(globalThis);
    if (err_int == -4094) return ZigString.static("UNKNOWN").toJS(globalThis);
    if (err_int == -3000) return ZigString.static("EAI_ADDRFAMILY").toJS(globalThis);
    if (err_int == -3001) return ZigString.static("EAI_AGAIN").toJS(globalThis);
    if (err_int == -3002) return ZigString.static("EAI_BADFLAGS").toJS(globalThis);
    if (err_int == -3003) return ZigString.static("EAI_CANCELED").toJS(globalThis);
    if (err_int == -3004) return ZigString.static("EAI_FAIL").toJS(globalThis);
    if (err_int == -3005) return ZigString.static("EAI_FAMILY").toJS(globalThis);
    if (err_int == -3006) return ZigString.static("EAI_MEMORY").toJS(globalThis);
    if (err_int == -3007) return ZigString.static("EAI_NODATA").toJS(globalThis);
    if (err_int == -3008) return ZigString.static("EAI_NONAME").toJS(globalThis);
    if (err_int == -3009) return ZigString.static("EAI_OVERFLOW").toJS(globalThis);
    if (err_int == -3010) return ZigString.static("EAI_SERVICE").toJS(globalThis);
    if (err_int == -3011) return ZigString.static("EAI_SOCKTYPE").toJS(globalThis);
    if (err_int == -3013) return ZigString.static("EAI_BADHINTS").toJS(globalThis);
    if (err_int == -3014) return ZigString.static("EAI_PROTOCOL").toJS(globalThis);

    if (err_int == -bun.C.UV_E2BIG) return ZigString.static("E2BIG").toJS(globalThis);
    if (err_int == -bun.C.UV_EACCES) return ZigString.static("EACCES").toJS(globalThis);
    if (err_int == -bun.C.UV_EADDRINUSE) return ZigString.static("EADDRINUSE").toJS(globalThis);
    if (err_int == -bun.C.UV_EADDRNOTAVAIL) return ZigString.static("EADDRNOTAVAIL").toJS(globalThis);
    if (err_int == -bun.C.UV_EAFNOSUPPORT) return ZigString.static("EAFNOSUPPORT").toJS(globalThis);
    if (err_int == -bun.C.UV_EAGAIN) return ZigString.static("EAGAIN").toJS(globalThis);
    if (err_int == -bun.C.UV_EALREADY) return ZigString.static("EALREADY").toJS(globalThis);
    if (err_int == -bun.C.UV_EBADF) return ZigString.static("EBADF").toJS(globalThis);
    if (err_int == -bun.C.UV_EBUSY) return ZigString.static("EBUSY").toJS(globalThis);
    if (err_int == -bun.C.UV_ECANCELED) return ZigString.static("ECANCELED").toJS(globalThis);
    if (err_int == -bun.C.UV_ECHARSET) return ZigString.static("ECHARSET").toJS(globalThis);
    if (err_int == -bun.C.UV_ECONNABORTED) return ZigString.static("ECONNABORTED").toJS(globalThis);
    if (err_int == -bun.C.UV_ECONNREFUSED) return ZigString.static("ECONNREFUSED").toJS(globalThis);
    if (err_int == -bun.C.UV_ECONNRESET) return ZigString.static("ECONNRESET").toJS(globalThis);
    if (err_int == -bun.C.UV_EDESTADDRREQ) return ZigString.static("EDESTADDRREQ").toJS(globalThis);
    if (err_int == -bun.C.UV_EEXIST) return ZigString.static("EEXIST").toJS(globalThis);
    if (err_int == -bun.C.UV_EFAULT) return ZigString.static("EFAULT").toJS(globalThis);
    if (err_int == -bun.C.UV_EHOSTUNREACH) return ZigString.static("EHOSTUNREACH").toJS(globalThis);
    if (err_int == -bun.C.UV_EINTR) return ZigString.static("EINTR").toJS(globalThis);
    if (err_int == -bun.C.UV_EINVAL) return ZigString.static("EINVAL").toJS(globalThis);
    if (err_int == -bun.C.UV_EIO) return ZigString.static("EIO").toJS(globalThis);
    if (err_int == -bun.C.UV_EISCONN) return ZigString.static("EISCONN").toJS(globalThis);
    if (err_int == -bun.C.UV_EISDIR) return ZigString.static("EISDIR").toJS(globalThis);
    if (err_int == -bun.C.UV_ELOOP) return ZigString.static("ELOOP").toJS(globalThis);
    if (err_int == -bun.C.UV_EMFILE) return ZigString.static("EMFILE").toJS(globalThis);
    if (err_int == -bun.C.UV_EMSGSIZE) return ZigString.static("EMSGSIZE").toJS(globalThis);
    if (err_int == -bun.C.UV_ENAMETOOLONG) return ZigString.static("ENAMETOOLONG").toJS(globalThis);
    if (err_int == -bun.C.UV_ENETDOWN) return ZigString.static("ENETDOWN").toJS(globalThis);
    if (err_int == -bun.C.UV_ENETUNREACH) return ZigString.static("ENETUNREACH").toJS(globalThis);
    if (err_int == -bun.C.UV_ENFILE) return ZigString.static("ENFILE").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOBUFS) return ZigString.static("ENOBUFS").toJS(globalThis);
    if (err_int == -bun.C.UV_ENODEV) return ZigString.static("ENODEV").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOENT) return ZigString.static("ENOENT").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOMEM) return ZigString.static("ENOMEM").toJS(globalThis);
    if (err_int == -bun.C.UV_ENONET) return ZigString.static("ENONET").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOSPC) return ZigString.static("ENOSPC").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOSYS) return ZigString.static("ENOSYS").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOTCONN) return ZigString.static("ENOTCONN").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOTDIR) return ZigString.static("ENOTDIR").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOTEMPTY) return ZigString.static("ENOTEMPTY").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOTSOCK) return ZigString.static("ENOTSOCK").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOTSUP) return ZigString.static("ENOTSUP").toJS(globalThis);
    if (err_int == -bun.C.UV_EPERM) return ZigString.static("EPERM").toJS(globalThis);
    if (err_int == -bun.C.UV_EPIPE) return ZigString.static("EPIPE").toJS(globalThis);
    if (err_int == -bun.C.UV_EPROTO) return ZigString.static("EPROTO").toJS(globalThis);
    if (err_int == -bun.C.UV_EPROTONOSUPPORT) return ZigString.static("EPROTONOSUPPORT").toJS(globalThis);
    if (err_int == -bun.C.UV_EPROTOTYPE) return ZigString.static("EPROTOTYPE").toJS(globalThis);
    if (err_int == -bun.C.UV_EROFS) return ZigString.static("EROFS").toJS(globalThis);
    if (err_int == -bun.C.UV_ESHUTDOWN) return ZigString.static("ESHUTDOWN").toJS(globalThis);
    if (err_int == -bun.C.UV_ESPIPE) return ZigString.static("ESPIPE").toJS(globalThis);
    if (err_int == -bun.C.UV_ESRCH) return ZigString.static("ESRCH").toJS(globalThis);
    if (err_int == -bun.C.UV_ETIMEDOUT) return ZigString.static("ETIMEDOUT").toJS(globalThis);
    if (err_int == -bun.C.UV_ETXTBSY) return ZigString.static("ETXTBSY").toJS(globalThis);
    if (err_int == -bun.C.UV_EXDEV) return ZigString.static("EXDEV").toJS(globalThis);
    if (err_int == -bun.C.UV_EFBIG) return ZigString.static("EFBIG").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOPROTOOPT) return ZigString.static("ENOPROTOOPT").toJS(globalThis);
    if (err_int == -bun.C.UV_ERANGE) return ZigString.static("ERANGE").toJS(globalThis);
    if (err_int == -bun.C.UV_ENXIO) return ZigString.static("ENXIO").toJS(globalThis);
    if (err_int == -bun.C.UV_EMLINK) return ZigString.static("EMLINK").toJS(globalThis);
    if (err_int == -bun.C.UV_EHOSTDOWN) return ZigString.static("EHOSTDOWN").toJS(globalThis);
    if (err_int == -bun.C.UV_EREMOTEIO) return ZigString.static("EREMOTEIO").toJS(globalThis);
    if (err_int == -bun.C.UV_ENOTTY) return ZigString.static("ENOTTY").toJS(globalThis);
    if (err_int == -bun.C.UV_EFTYPE) return ZigString.static("EFTYPE").toJS(globalThis);
    if (err_int == -bun.C.UV_EILSEQ) return ZigString.static("EILSEQ").toJS(globalThis);
    if (err_int == -bun.C.UV_EOVERFLOW) return ZigString.static("EOVERFLOW").toJS(globalThis);
    if (err_int == -bun.C.UV_ESOCKTNOSUPPORT) return ZigString.static("ESOCKTNOSUPPORT").toJS(globalThis);
    if (err_int == -bun.C.UV_ENODATA) return ZigString.static("ENODATA").toJS(globalThis);
    if (err_int == -bun.C.UV_EUNATCH) return ZigString.static("EUNATCH").toJS(globalThis);

    const fmtstring = bun.String.createFormat("Unknown system error {d}", .{err_int}) catch bun.outOfMemory();
    return fmtstring.toJS(globalThis);
}