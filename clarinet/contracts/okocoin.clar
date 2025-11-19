(define-fungible-token okocoin)

(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-INSUFFICIENT-BALANCE (err u101))

(define-data-var owner principal tx-sender)

(define-read-only (get-owner)
  (ok (var-get owner)))

(define-public (transfer (amount uint) (sender principal) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender sender) ERR-NOT-AUTHORIZED)
    (try! (ft-transfer? okocoin amount sender recipient))
    (ok true)))

(define-public (mint (amount uint) (recipient principal))
  (begin
    (asserts! (is-eq tx-sender (var-get owner)) ERR-NOT-AUTHORIZED)
    (try! (ft-mint? okocoin amount recipient))
    (ok true)))

(define-public (burn (amount uint) (owner- principal))
  (begin
    (asserts! (is-eq tx-sender owner-) ERR-NOT-AUTHORIZED)
    (try! (ft-burn? okocoin amount owner-))
    (ok true)))

(define-read-only (get-balance (account principal))
  (ok (ft-get-balance okocoin account)))

(define-read-only (get-total-supply)
  (ok (ft-get-supply okocoin)))
