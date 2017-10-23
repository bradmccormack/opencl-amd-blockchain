# Maintainer: Brad McCormack <bradmccormack100@gmail.com>
# Contributor: grmat <grmat@sub.red>

pkgname=opencl-amd
pkgdesc="OpenCL userspace driver as provided in the amdgpu-pro driver stack. This package is intended to work along with the free amdgpu stack."
pkgver=17.40.483984
pkgrel=3
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd')
conflicts=('amdgpocl')

DLAGENTS='https::/usr/bin/wget --referer https://support.amd.com/en-us/kb-articles/Pages/AMDGPU-Pro-Beta-Mining-Driver-for-Linux-Release-Notes.aspx -N %u'

_prefix='amdgpu-pro-'
_major='17.40'
_minor='483984'
_shared="opt/amdgpu-pro/lib/x86_64-linux-gnu"

source=("https://www2.ati.com/drivers/linux/beta/ubuntu/${_prefix}${_major}-${_minor}.tar.xz")
sha256sums=('b9cfd203adc19d54f2a3e1120e7a541cb5732ca0354b5b860096ba5bd3451778')

pkgver() {
	echo "${_major}.${_minor}"
}

package() {
	mkdir "${srcdir}/opencl"
	cd "${srcdir}/opencl"

	ar x "${srcdir}/${_prefix}${_major}-${_minor}/opencl-amdgpu-pro-icd_${_major}-${_minor}_amd64.deb"
	tar xJf data.tar.xz
	cd ${_shared}
	sed -i "s|libdrm_amdgpu|libdrm_amdgpo|g" libamdocl64.so

	mkdir "${srcdir}/libdrm"
	cd "${srcdir}/libdrm"
	ar x "${srcdir}/${_prefix}${_major}-${_minor}/libdrm2-amdgpu-pro_2.4.82-${_minor}_amd64.deb"
	tar xJf data.tar.xz

	cd ${_shared}
	echo "PWD = ${PWD}"
	rm "libdrm_amdgpu.so.1"
	mv "libdrm_amdgpu.so.1.0.0" "libdrm_amdgpo.so.1.0.0"
	ln -s "libdrm_amdgpo.so.1.0.0" "libdrm_amdgpo.so.1"

	mv "${srcdir}/opencl/etc" "${pkgdir}/"
	mkdir -p "${pkgdir}/usr/lib"
	mv "${srcdir}/opencl/${_shared}/libamdocl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/opencl/${_shared}/libamdocl12cl64.so" "${pkgdir}/usr/lib/"
	mv "${srcdir}/libdrm/${_shared}/libdrm_amdgpo.so.1.0.0" "${pkgdir}/usr/lib/"
	mv "${srcdir}/libdrm/${_shared}/libdrm_amdgpo.so.1" "${pkgdir}/usr/lib/"

    mkdir -p "${pkgdir}/opt/amdgpu-pro/share/libdrm"
    cd "${pkgdir}/opt/amdgpu-pro/share/libdrm"
    ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

	rm -r "${srcdir}/opencl"
	rm -r "${srcdir}/libdrm"
}

